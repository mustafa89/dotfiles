import os, fcntl, termios, subprocess
#cmd = "ls -l /proc/$(pgrep -n nvim)/fd/ | grep '/dev/pts/*' | awk '{print $11}' | uniq"
out = []
#cleaned = []
cmd = "ps aux | grep pts | grep nvim | grep -v grep | awk '{print $7}' | grep -o '[0-9]'"
res = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
out += res.stdout.read()
#cleaned = [ x for x in out if x.isdigit() ]
out = filter(str.isdigit, out)
#cleaned = [ x for x in ls if x.isdigit() ]
print(out)
for x in out :
    print(x)
    fd = os.open('/dev/pts/%s' % (x), os.O_RDWR)
    a = '\033:wqa!\n'
    for i in a:
        fcntl.ioctl(fd, termios.TIOCSTI, i)
