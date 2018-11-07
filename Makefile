run:
	gradle asciidoctor --no-daemon
view:
	open build/asciidoc/pdf/prob_user_manual.pdf
viewd:
	open build/asciidoc/pdf/prob_developer.pdf
clean:
	gradle clean
