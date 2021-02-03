= ${title}
${authors?join(";", "")}

:xrefstyle: short
:toc:

<#list directories as directory>
:leveloffset: +1

<#list directory as file>
include::${file}[]

</#list>
:leveloffset: -1
</#list>
