make: files
	ls -laR ~/ > files

runSuummary: filesummary.awk files
	gawk -f filesummary.awk files	 

runPassword: pwfile.awk
	gawk -f pwfile.awk /etc/passwd

runAll: filesummary.awk files pwfile.awk
	gawk -f filesummary.awk files	 
	gawk -f pwfile.awk /etc/passwd
clean:
	rm -r files
