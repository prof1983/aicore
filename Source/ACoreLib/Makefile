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

	#Создание объектного файла
	gcc -Wall -g -c ACoreLibTest.c -o ACoreLibTest.o
	#Создание исполняемого файла:
	#-L. - этот параметр указывает компилятору, что поиск при компиляции необходимо проводить в текущей директории
	#-lACoreLib - этот параметр определяет имя файла, в котором содержится необходимая библиотека
	gcc -g -o ACoreLibTest ACoreLibTest.o -L. -lACoreLib

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

	#Создаем объектный файл
	gcc -Wall -g -c ACoreLibTest.c -o ACoreLibTest.o
	#Создаем исполняемый файл
	#-L. - этот параметр указывает компилятору, что библиотеку следует искать в текущей директории.
	#-lACoreLib-static - этот параметр указывает компилятору, что библиотека помещается в файле
	#ACoreLib-static.расширение (.a, .o, .so).
	gcc -g -o ACoreLibTest_static ACoreLibTest.o -L. -lACoreLib-static

runstatic:
	#Выполнение исполняемого файла
	./ACoreLibTest_static

clear:
	rm ACoreLibTest.o
	rm ACoreLib-static.a
	rm ACoreLib-static.o

clearbin:
	rm ACoreLib
	rm ACoreLib_static
	rm ACoreLib.so
	rm ACoreLib.so.0
	rm ACoreLib.so.0.0