import glob, os
for file in glob.glob("*.cpp"):
	#print(file)
	os.system("sh grader.sh " + file)

