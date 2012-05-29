compile:
	#Создаем объектный файл, пригодный впоследствие для создания разделяемой библиотеки.
	#Обращаем внимание на ключ -fPIC
	# gcc -fPIC -Wall -g -c ACoreLib.c
	gcc -fPIC -Wall -c ACoreLib.c
	#Создаем разделяемую библиотеку
	#-lc  - этот аргумент указывает, что компиляция происходи с участием стандартной C-библиотеки libc, поскольку ACoreLib.o зависит от libc
	#-Wl - предшествует параметрам, передаваемым линкеру (сборщику исполняемого файла) 
	gcc -g -shared -Wl,-soname,ACoreLib.so.0 -o ACoreLib.so.0.0 ACoreLib.c -lc
	#Если обладаете правами суперпользователя, то можно выполнить
	# cp ACoreLib.so.0.0 /usr/local/lib/
	#Ключ -n указывает ldconfig, что обработать нужно только директории указанные в командной строке, в данном случае - только текущую директорию. 
	/sbin/ldconfig -v -n .
	#Создание символической ссылки
	ln -sf ACoreLib.so.0 ACoreLib.so

compilestatic:
	#Ключ -g можно удалить, он используется только для проведения отладки при помощи gdb. 
	#Создаем объектный файл
	#gcc -Wall -g -c -o ACoreLib-static.o ACoreLib.c
	gcc -Wall -c -o ACoreLib-static.o ACoreLib.c
	#Создаем статическую библиотеку
	ar rcs ACoreLib-static.a ACoreLib-static.o
	#Если обладаете правами суперпользователя, то можно выполнить
	# cp ACoreLib-static.a /usr/local/lib/
	#Иначе оставляем статическую библиотеку в текущей директории

clear:
	rm ACoreLib-static.a
	rm ACoreLib-static.o
clearbin:
	rm ACoreLib.so
	rm ACoreLib.so.0
	rm ACoreLib.so.0.0