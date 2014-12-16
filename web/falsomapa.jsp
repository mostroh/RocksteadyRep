<HTML>
    <HEAD>
        <TITLE>Prueba</TITLE>
        <SCRIPT language="Javascript">

            function muestra() {
                document.getElementById("Prueba").innerHTML = "Esto es una prueba de que se cambia al pulsar sobre el enlace";
            };
            
        </SCRIPT>
    </HEAD>
    <BODY>
        <TABLE border="1">
            <TR><TD><B><U>Esto no se cambia:</U></B></TD></TR>
            <TR>
                <TD><DIV ID="Prueba" onclick="muestra();">
                        Este texto es el normal y al pulsar encima de el se cambia.
                    </DIV>

                </TD>
            </TR>

        </TABLE>

    </BODY>
</HTML> 