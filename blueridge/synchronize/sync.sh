TIMESTAMP=$(date +%Y-%m-%d.%H-%M)
LOG_FILE="/home/pi/store/SaltLogs/{{ machine }}/{{ machine.lower() }}-$TIMESTAMP.log"
salt '{{ machine }}' state.apply {{ machine.lower() }} --force-color --out-file=$LOG_FILE
