import json
import sys

directory_file = '/root/directory.json'
first_port = 4000

try:
    with open(directory_file, 'r') as directory_f:
        directory = json.loads(directory_f.read())
except FileNotFoundError as e:
    directory = {}


def main():
    args = sys.argv
    flag = args[1]

    if flag == 'exists':
        if projectExists(args[2]):
            print('0')
        else:
            print('1')
    elif flag == 'port':
        if projectExists(args[2]):
            print(getPort(args[2]))
        else:
            print('-1')
    elif flag == 'new':
        if projectExists(args[2]):
            print(getPort(args[2]))
            return
        newProject(args[2])
        print(getPort(args[2]))


def projectExists(project):
    return (project in directory)

def getPort(project):
    return directory[project]['port']

def newProject(name):
    directory[name] = {
        'port': _firstOpenPort()
        }
    _write()

def _write():
    with open(directory_file, 'w') as directory_f:
        directory_f.write(json.dumps(directory))

def _firstOpenPort():
    ports = list(map(lambda x: x[1]['port'], directory.items()))
    return max(ports + [first_port]) + 1

main()
