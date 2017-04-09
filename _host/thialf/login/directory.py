import json
import sys

directory_file = '/home/hacker/directory.json'
first_port = 4000

try:
    with open(directory_file, 'r') as directory_f:
        directory = json.loads(directory_f.read())
except Exception as e:
    directory = {}


def main():
    args = sys.argv
    flag = args[1]
    target = args[2].strip()

    if flag == 'exists':
        if projectExists(target):
            print('0')
        else:
            print('1')
    elif flag == 'port':
        if projectExists(target):
            print(getPort(target))
        else:
            print('-1')
    elif flag == 'new':
        if projectExists(target):
            print(getPort(target))
            return
        newProject(target)
        print(getPort(target))


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

if __name__ == '__main__':
    main()
