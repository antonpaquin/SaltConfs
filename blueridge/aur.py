''' this is not done '''

from __future__ import absolute_import
import copy
import logging
import re
import os.path

import salt.exceptions
import salt.utils
from salt.exceptions import CommandExecutionError, MinionError

def installed(name):
    cmd = []
    cmd.append('pacaur')
    cmd.extend(['-S', '--noprogressbar', '--noconfirm'])
    cmd.append(name)

    out = __salt__['cmd.run_all'](
        cmd,
        output_loglevel='trace',
        python_shell=False
    )

    if out['retcode'] != 0 and out['stderr']:
        errors = [out['stderr']]
    else:
        errors = []

    __context__.pop('pkg.list_pkgs', None)
    new = _list_pkgs()
    ret = salt.utils.compare_dicts(old, new)

    if errors:
        raise CommandExecutionError(
            'Problem encountered installing package(s)',
            info={'errors': errors, 'changes': ret}
        )

    return ret

def _list_pkgs(versions_as_list=False, **kwargs):
    '''
    List the packages currently installed as a dict::
        {'<package_name>': '<version>'}
    CLI Example:
    .. code-block:: bash
        salt '*' pkg.list_pkgs
    '''
    versions_as_list = salt.utils.is_true(versions_as_list)
    # not yet implemented or not applicable
    if any([salt.utils.is_true(kwargs.get(x))
            for x in ('removed', 'purge_desired')]):
        return {}

    if 'pkg.list_pkgs' in __context__:
        if versions_as_list:
            return __context__['pkg.list_pkgs']
        else:
            ret = copy.deepcopy(__context__['pkg.list_pkgs'])
            __salt__['pkg_resource.stringify'](ret)
            return ret

    cmd = ['pacman', '-Q']

    if 'root' in kwargs:
        cmd.extend(('-r', kwargs['root']))

    ret = {}
    out = __salt__['cmd.run'](cmd, output_loglevel='trace', python_shell=False)
    for line in salt.utils.itertools.split(out, '\n'):
        if not line:
            continue
        try:
            name, version_num = line.split()[0:2]
        except ValueError:
            log.error('Problem parsing pacman -Q: Unexpected formatting in '
                      'line: \'{0}\''.format(line))
        else:
            __salt__['pkg_resource.add_pkg'](ret, name, version_num)

    __salt__['pkg_resource.sort_pkglist'](ret)
    __context__['pkg.list_pkgs'] = copy.deepcopy(ret)
    if not versions_as_list:
        __salt__['pkg_resource.stringify'](ret)
    return ret
