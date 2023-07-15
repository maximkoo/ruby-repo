::rmdir 2
IF EXIST 2 (
	cd 2 
	IF EXIST fff.txt del /Q fff.txt
	IF EXIST qqq.txt del /Q qqq.*
	cd ..
	rmdir 2
)