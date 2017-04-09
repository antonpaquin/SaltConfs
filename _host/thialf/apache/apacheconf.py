from jinja2 import Template
import sys

with open('/home/hacker/config_template') as template_f:
    template = Template(template_f.read())

def new(projectName, port):
    output = template.render(serviceName=projectName, port=port)
    out_fname = '/etc/apache2/projects/' + projectName
    with open(out_fname, 'w') as out_f:
        out_f.write(output)

def main():
    args = sys.argv
    command = args[1]

    if command == 'new':
        projectName = args[2]
        port = args[3]
        new(projectName, port)


if __name__ == '__main__':
    main()
