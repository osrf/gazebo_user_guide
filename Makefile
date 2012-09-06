DOXYGEN = doxygen
BASE_NAME = gazebo

all: html pdf

html: manual.dox 
	$(DOXYGEN) $< 

pdf: manual.dox
	$(DOXYGEN) $<
	cd user_guide/latex;make pdf; mv refman.pdf ../../gazebo_user_guide.pdf

clean:
	rm -rf user_guide *.pdf
