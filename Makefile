run:
	rm -f build/asciidoc/pdf/*.pdf
	JAVA_OPTS="-Xmx2G" ./gradlew --no-daemon asciidoctor
view:
	open build/asciidoc/pdf/prob_user_manual.pdf
viewd:
	open build/asciidoc/pdf/prob_developer.pdf
fullclean:
	gradle clean
clean:
	rm build/asciidoc/pdf/*.pdf