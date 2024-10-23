#!/bin/bash

# Проверяем, что переданы 4 аргумента
[ "$#" -lt 4 ] && echo "Использование: $0 <строка> <начало> <конец> <действие (выделить или удалить)>" && exit 1

input_string="$1"  # Строка
start_pos="$2"     # Начало подстроки
end_pos="$3"       # Конец подстроки
action="$4"        # Действие

substring=$(echo "$input_string" | cut -c"$start_pos"-"$end_pos")

# Выполняем действие
case "$action" in
  выделить) echo "$substring" ;;
  удалить) echo "${input_string:0:start_pos-1}${input_string:end_pos}" ;;
  *) echo "Действие должно быть 'выделить' или 'удалить'" && exit 1 ;;
esac
