run:
	rm build/asciidoc/pdf/*.pdf
	gradle asciidoctor --no-daemon
view:
	open build/asciidoc/pdf/prob_user_manual.pdf
viewd:
	open build/asciidoc/pdf/prob_developer.pdf
fullclean:
	gradle clean
clean:
	rm build/asciidoc/pdf/*.pdf