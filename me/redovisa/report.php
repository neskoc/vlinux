<?php
$title = "Redovisningssida | vlinux (v1)";
include("incl/header.php");
include("incl/navbar.php");
?>
<main>
    <article class="all-browsers">
        <header>
            <h1>Redovisning av kursmoment</h1>
        </header>
        <p>
            Här kommer finnas redovisningstexter för de olika kursmomenten.
        </p>

        <section class="kmom">
            <h2>Kmom01</h2>
            <p>
                Den här redovisningen men troligtvis gäller det generellt för denna kurs kommer kännas upprepande.
                <br>
                Det är mer än 30 år jag första gången stött på (HP) unix, dumma terminal och os på tape.
                Sedan dess har det gott på löpande band: först Slackware, brottning med att få till stöd för olika typer av hårdvara och mängd olika linuxdistron och jag skriver denna text på Manjaro medan jag kör Kubuntu på resten av mina datorer.
                <br>
                Med andra ord är jag van vid terminalen och linux kommandon.
            </p>
            <p>
                Även Virtual Box är min gamla bekant som jag använt de senaste 12-13 åren om jag nu minns rätt.
                Från början var det Linux som gäst och Windows som värd, numera Linux som värd och olika windowsversioner som gäst os.
                Jag har inte kört så mycket Debian utan det det har varit mest Ubuntu på servrarna och Kubuntu på skrivbordet.
                I och med att båda härstammar från Debian kan man nog säga att jag känner mig väldigt bekväm med Debian.
                <br>
                Av bekvämlighets skäl har jag valt att köra Debian på Virtual Box.
            </p>
            <p>
                En gång i tiden var Virtual Box ganska resurskrävande och det kändes trögt att köra virtuella maskiner med Gui,
                ja det kunde få även värdoperativet på knäna.
                Sedan dess har Oracle lyckats fixa de flesta barnsjukdomar, krascharna har blivit sälsynta,
                tillgängligt RAM-minne har ökat exponentiellt likaså antalet processorkärnor/trådar och ssd har ersatt mekaniska diskar
                så att man inte märker att man kör Virtual Box.
                <br>
                Det är bara att ladda ner image och på 15 minuter få igång ny instans. Den tiden man fick vänta i ett par dagar på att kernel skulle kompileras klart (utan att veta om det kommer fungera eller inte) är ett minne blott.
                <br>
                Det är lätt att föra informationen från värden till gästos, mellan olika virtuella maskiner och det är så pass stabilt att man nog skulle kunna köra skarpt serveros inom Virtuell Box.
                <br>
                På jobbet var det Windows för hela slanten och det var skönt att kunna köra den virtuellt då jag verkligen var tvungen att använda den.
                <br>
                Virtuell Box är också ett utmärkt verktyg för testmiljö samt en sandlåda där man kan leka med utan att kompromitera säkerheten. Att man kan ta snapshots, klona och distribuera/demonstrera är andra exempel på varför Virtual Box är ett utmärkt verktyg.
            </p>
            <p>
                Installation av Guest Additions blev också en smidig process och allt gick faktiskt väldigt fort.
                Jag kör Virtual Box för första gången på en ny bärbar dator jag köpt någon gång tidigt under våren och jag blev positivt överraskad av hur snabbt allt gick till trots att jag redan hade ställt ribban högt.
                <br>
                Till slut kan jag nämna att jag tycker det var trevligt att läsa mer om tmux. Det hade jag använt under några årmen utan att använda panes/windows mest när jag skulle fjärrstyra/uppdatera os så att sessionen kunde fortsätta även om anslutningen skulle gå ner av någon anledning.
                <br>
                Nu ser jag att det var väldigt enkelt att köra flera panes och windows. Det kan jag ta med mig som mest nyttigt från detta kmom.
            </p>
        </section>

        <section class="kmom">
            <h2>Kmom02</h2>
            <p>
                Det är ca. 20 sedan jag första gången stött på webbservrar: Apache och IIS.
                Därför känns konceptet med name-based Virtual Hosts väldigt naturligt.
                <br>
                Under åren har jag skapat och administrerat dem både i egen regi och åt andra.
                Därför har detta kursmoment känts väldigt lätt.
                <br>
                I och med att jag återanvänt en me-sidan skriven i php fick jag installera php på min virtuella debian också.
            </p>
            <p>
                I och med att mina första steg inom IT-världen skedde då GUI var reserverat för dyra grafiska arbetsstationer,
                senare även första mac-datorer samt att jag en gång i tiden läst Cobol och skrivit dess kod på papperet utan att någonsin testa den i en dator blev en blinkande kursor en lyx att se.
                <br>
                Med andra ord känns även CLI absolut ok och ett nödvändigt komplement till GUI.
            </p>
            <p>
                Och ytterligare en upprepning: Jag har hållit på med ssh under många år och har bra koll på krypteringstekniker.
                Med andra ord ytterligare en sak som känns bekväm att sätta upp och använda.
                <br>
                Jag fick bara lite problem att få till porten i rsync men efter en del experimenterande och fundering kom jag på att lägga portdirektiv ihop med ssh.
            </p>
            <p>
                Jag har redan skrivit om tmux i kmom1 så jag hänvisar till den redovisningen. 
            </p>
            <p>
                Jag har linux på skrivbordet på mina samtliga datorer förutom en bärbar mac från 2011. Den hade jag kvar för att kunna köra program som inte finns för linux men nu är ett tag sedan Apple släppte en macos som går att installera på den dator så alla dess fördelar håller på att försvinna.
                <br>
                Jag tycker linux är så pass bra att även "tvingat" den på mina föräldrar och ett antal andra personer.
                Med andra ord gillar jag linux och öppen källkod i allmänhet.
            </p>
        </section>

        <section class="kmom">
            <h2>Kmom03</h2>
            <p>
                Som jag svarat i redovisningstexten för första två kmoms har jag hållit på med *nix under väldigt många år och under tiden har jag till och från jobbat med bash samt i lägre grad med andra kommandoskal.
                <br>
                Med andra ord är det inget nytt för mig.
                I och med att det är ganska glest mellan de tillfällen jag behöver använda bash brukar det ta en stund tills man blir varm i kläderna och det blev inget undantag den här gången heller.
            </p>
            <p>
                Jag tycker bash är rätt så trevlig att arbeta med även om jag hade önskat man kunde göra mer på ett enklare sätt exempelvis vad det gäller arbetet med strängar. Även syntaxen för arbetet med arrayer känns udda i synnerhet att användning av index inte är konsekvent (i vissa fall räknar man från 0 medan i andra från 1).
                <br>
                Det är egentligen här som jag fick kämpa lite extra för att få till revers-funktionen.
                <br>
                Ja, vill man göra mer får man väl använda perl och jag tycker det är synd att det känns som att det språket är på väg att dö ut.
            </p>
            <p>
                Precis som andra skriptspråk har bash ganska förlåtande regler samtidigt som den har sina egna konstigheter som mellanslag då man skall skriva uttryck mellan dubbla parenteser.
                Även felmeddelanden kan var missvisande och/eller obegripliga om man har otur.
                <br>
                Så behöver man göra något snabbt och på ganska låg nivå passar skriptspråk väl men för lite mer avancerade saker bör man hålla sig till äkta programmeringsspråk.                
            </p>
            <p>
                Till skillnad från *nix, bash och Virtual Box (VB) började jag stöta på docker först för drygt ett år sedan inom en IoT kurs.
                Där fick jag upp ögonen för docker då jag upptäckte att man kunde köra det väldigt smidigt på en Raspberry Pi.
                För det mesta var det att använda färdiga docker avbildningar med väldigt lite specialanpassningar (DB lösenord, inloggningsuppgifter och liknande). 
            </p>
            <p>
                Som jag nämnde går det utmärkt att köra docker på en Raspberry Pi (RPi) utan att den ens märker att man kör det.
                Med andra har den en liten "fo0tprint", har lågt resursbehov och återanvänder de redan installerade bibliotek från värdos:t.
                Dessutom brukar man köra utan gui.
                <br>
                Å andra sidan är det nog i princip omöjligt att köra VB på en RPi och det programmet är väldigt resurskrävande.
                Dessutom är man tvingad in i GUI även om själva imagen inte använder det.
                <br>
                Samtidigt är kravet på användarens djupare teknisk kompetens betydligt lägre än för docker.
                Det är också väldigt smidigt att hantera ögonblicksbilder och att exportera och migrera till någon annan maskin.
            </p>
        </section>

        <section class="kmom">
            <h2>Kmom04</h2>
            <p>
                I och med att vi håller på med en parallell kurs i jsramverk har jag valt att köra node/js
                för min serverlösning. Första 3 kmoms gjorde jag i augusti och började med den fjärde
                men sedan blev jag upptagen med annat. Nu efterhand är jag glad att det blev så
                för vi hann gå igenom express och api i kmom02 i jsramverk-kursen vilket underlättade arbetet med detta kursmomen.
            </p>
            <p>
                I kmom03 blev det lite fel med docker (Dockerfile) och hur jag uppfattade olika kommandon.
                Den här gången gick det fort och smidigt och jag börjar känna mig rätt så bekväm med docker.
                Efter kmom5 och kmom06 tror jag att jag kommer nog börja älska docker ;)
            </p>
            <p>
                Arbetet med kmom02 i jamverk har underlättat även arbetet med konceptet klient-server.
                Visserligen använde vi där js hela vägen men konceptet med api på serversidan och klienten som anropar api:t
                följer samma logik även om man använder cli och bash.
                <br />
                Så ja, jag kan väl påstå att jag hänger med det konceptet.
            </p>
            <p>
                Mitt bash-skript var ganska likt i upplägget som i kmom03. Användningen av curl var rätt så rättfram
                och det enda jag kämpade med lite grann var att få till optionerna/argumenten till curl.
                <br />
                Efter lite googling och experimenterande fick jag till det via eval.
                <br/>
                Jag funderade också på om jag skulle göra det möjligt att tillåta optionerna ligga var som helst men bestämde mig att göra det lätt för mig och kräva att de kommer först.            
            </p>
            <p>
                En sista sak jag funderade lite över var hur resultat av test skall sparas för det var inte specificerat i detalj.
                Jag valde att skriva ett eget meddelande med http kod.
            </p>
        </section>

        <section class="kmom">
            <h2>Kmom05</h2>
            <p>
                Generellt kan jag säga att detta kursmoment tog betydligt mer tid än jag uppskattade det skulle ta
                från början.
            </p>
            <p>
                Jag kämpade en hel del med `sed` och uppgiften 1.5 (matchning av mejls). I regex101 såg allt det
                bra ut där jag strävade efter att matcha så många regler som möjligt bl.a. specialtecken och kommentarer.
                <br>
                När jag sedan försökte köra som sed-argument fick jag felmeddelanden som inte var så hjälpsamma.
            </p>
            <p>
                Mitt ursprungliga regex var:
                <br>
                <b>
                    ^(?=.{1,64}@.{1,253}$)(((\(.*\))?([\w!#$%&'*+\-\/=?^_`{|}~]+\.?)*[\w!#$%&'*+\-\/=?^_`{|}~]+)|(\"[\w\s!#$%&'*+\-\/=?^_`{|}~(),:;<>@\[\]]+\"))@((([a-zA-Z\d]+)|([a-zA-Z\d]+-[a-zA-Z\d]+))\.)+(([a-zA-Z]+){2,})
                </b>
                <br>
                som efter några timmar av hårslitning till slut blev:  
                <br>
                <b>
                    ((([a-zA-Z0-9_]+\.?)*[a-zA-Z0-9_~]+)|(\"[a-zA-Z0-9 ]+\"))@((([a-zA-Z0-9]+)|([a-zA-Z0-9]+-[a-zA-Z0-9]+))\.)+(([a-zA-Z]+){2,})
                </b>
            </p>
            <p>
                Jag fick också "fuska" för att kunna matchar förväntat resultat och inte trigga felmeddelanden.
                Min tolkning av reglerna för domain motsvarade inte det förväntade resultatet:
                <ul>
                    <li>
                    <strong>c0m</strong> - regeln: <b><i>digits 0 to 9, provided that top-level domain names are not all-numeric</i></b>,
                    <br>
                    ingenstans i reglerna för hostname/dns blev den regeln utökad förutom genom ICANN:s listan över aktuella TLD:s
                men inget säger att fler inte kommer tillåtas i framtiden
                    </li>
                    <li>
                        jag har inte heller hittat någon regel som inte tillåter TLD av längd 1 även om det historiskt
                var av längden {2,3} för att få fler tecken på senare åren 
                    </li>
                </ul>
                Resten av sed gick utan något större problem.
            </p>
            <p>
                Att göra ett större bash-skript var inte så besvärligt men djävulen ligger i detaljerna.
                Det blev en hel del brottning med associativa arrayer och det blev en del svett och tårar delvis
                för att jag kopierade några rader utan att uppdatera variablerna på samtliga ställen.
                Arrayen fick skulden och det tog mig några timmar tills jag upptäckte att skriptet läste från rätt fil.http://www.student.bth.se/~necu20/dbwebb-kurser/vlinux/me/kmom05/
                <br>
                Ja, programmering och felsökning i bash är inte som att gå på rosorna eller snarare det är som att
                barfota gå på rosorna med taggarna kvar :)
            </p>
            <p>
                I och med att jag till och från använt regex i en hel del år känns det ganska naturligt att använda det.
                Det blev till och med lite användning i bash-skriptet också (kontroll att variabel är ett nummer).  
                Samtidigt blev det lite strul i labbet vilket jag beskrev ovan. Så det blev lite blandade känslor
                i det konkreta fallet.
            </p>
            <p>
                Även sed hade jag stött på en gång i tiden eller snarare några gånger så jag fick damma av kunskapen
                och läsa på en del. Jag fick använda både sed och awk samt wc/cut i mitt skript
                (tyvärr inte mina egna lösningar utan resultat av googling).
                <br>
                Ja, i linux kan man göra saker på massa olika sätt. Tyvärr finns en stor risk att den uppfräschade
                kunskapen inte kommer används till något användbart inom en överskådlig tid men man vet aldrig.
                <br>
                Jag har i alla fall tvingat mig att använda tmux med panes genom docker-delen så jag tror att jag
                känner mig mer bekväm med det.
            </p>
            <p>
                Jag kollade inte på källkoden för maze så jag har inga synpunkter om detta.
            </p>
        </section>

        <section class="kmom">
            <h2>Kmom06</h2>
            <p>
                Det blev igen en hel del brottning med felsökning i bash men till slut blev det nästan som jag önskat.
                <br>
                Det var igen en del problem med dictionary (associativa arrayer) men jag har nu fått ett bättre grepp om
                dem. Jag spenderade också en hel del tid på att få till select-kommando och att återanvända funktionerna
                från kmom05.
                <br>
                För det mesta behöll jag den gamla strukturen men införde lite nya saker som silent-variabel för att
                slippa visa vissa meddelanden i loop-funktionerna.
            </p>
            <p>
                Övergången till docker-compose gick rätt så smidigt till men vi har väl bara börjat skrapa lite på ytan.
                När man använder bara två konteinrar märker man inte så stor skillnad mot att köra "ren" docker.
                Det gör det kanske till och med onödigt komplicerat.
                <br>
                I en mer komplex miljö är det betydligt enklare om man har allt samlat på ett ställe i en yaml
                konfigurationsfil. Det finns också linter för docker/yaml vilket underlättar utvecklingen.
            </p>
            <p>
                Vad det gäller klient/server har jag haft en bra koll på det även tidigare så det blev inte så mycket
                nytt. Det som var nytt är hur de samspelar i en docker miljö.
                <br>
                Trots att jag tidigare använt docker i en liten skala har inte upplevt att jag hade så bra förståelse av
                det. Nu tror jag att jag har fått en bra uppfattning även om själva kunskapen om docker detaljer
                fortfarande är på en ganska låg nivå. Med det sagt tror jag att lärandekurvan härifrån kommer gå
                brant upp.
                <br>
                Och ja, jag kommer definitivt (fortsätta) att använda docker utanför kursens ramar.
            </p>
            <p>
                För det mesta upplevde jag awk-labben som ganska enkla. Jag har använt sporadiskt använt awk under årens
                lopp och jag trodde att jag kunde en hel del om det.
                <br>
                Nu när jag har kollat lite https://www.gnu.org/software/gawk inser jag hur stort det är eller har blivit
                sedan jag stötte på det för första gången för ca. 25-26 år sedan.
                <br>
                Tyvärr upplever jag liknande problem med awk som med bash-skript: det är svårt att felsöka. Jag fick
                kämpa en hel del med strängar eller rättare sagt hopsättning av strängar. Utan att kolla manualen
                utgick jag ifrån att det fungerade på liknande sätt som i högnivå programmeringsspråk vilket visade sig
                vara fel och jag slet i håret för att jag inte fick datumformat på ett korrekt sätt. Först efter några
                timmar av felsökning riktade jag mina misstankar mot strängarna samt sökte på nätet mer information.
                <br>
                Förutom detta var resten relativt enkelt. 
            </p>
        </section>
        <section class="kmom">
            <h2>Kmom010</h2>
            <p>
                Jag har valt att implementera samtliga krav.
            </p>
            <h3>Krav1 Regex för att konvertera loggfil till JSON</h3>
            <p>
                I och med att jag redan från början valt att implementera samtliga krav har jag skapat ett skript
                som uppfyller kraven för både krav1 och krav5. Det blev lite förvirring hur vi skall räkna antalet
                rader och om vi skall ha indragningar. Här gick jag först med indragningar, sedan tog jag bort dess
                men till slut lade jag till dem på nytt.
                <br>
                Exempel på resultat som visades på dbwebb var inte representativt tycker jag för jag upptäckte att
                och lämnade en hel del åt tolkningarna.
            </p>
            <p>
                Jag kämpade mest med att hantera sista kommatecken som inte skall finnas med
                och försökte att lösa allt med awk. Jag lyckades inte hitta någon lösningar
                och till slut blev det först awk, sedan head -n -1 och till slut lägga till avslutande }].
            </p>
            <h3>Krav2 Server för att servera loggen</h3>
            <p>
                Även här gjorde jag allt från krav5 på en gång. Jag har valt att tillåta alla kombinationer filter.
                Så man kan fritt kombinera/sätta ihop olika parametrar. Det fick mig tänka lite extra på
                hur jag skall få ihop detta på ett smidigt och det blev en del if-satser kombinerat med en flagga
                som avgör när man skall lägga "&" tecken i url.
            </p>
            <p>
                Mest tid gick åt att hantera time-intervall. Här fick jag hjälp av Date-typen samt att dela upp
                tiden med kolon fylla i Date-variablerna och jämföra dem. Just det, jag använder node/express.
            </p>
            <h3>Krav3 Bashscript för att testa servern</h3>
            <p>
                Jag valde att göra detta sist för jag tyckte att json/server/webbclient hängde logiskt ihop.
                Även här tyckte jag att ett krav (url) var otydligt så jag har gjort en egen tolkning:
                man får en url till  servern API (/data).
            </p>
            <p>
                En del tid gick åt att ha två nivåer av switch-satser, en generell i main och den andra
                för view-kommandon. Jag har gjort det lätt för mig och valt att inte tillåta kombination av kommandon.
            </p>
            <p>
                -c flagga både visar resultat och räknar antal rader. Här kämpade jag med att få till raderna
                för curl fick tillbaka allt i en rad, dessutom lagt under "logs". Lösningen blev en jq-pipe.
                <br>
                För att få till både innehållet och antalet rader använder jag tee. 
            </p>
            <h3>Krav4 Webbklient</h3>
            <p>
                Här har jag valt att lägga filter och resultat på samma sida och separera dem med get/post request.
                Resultatet presenteras i en tabell och filter har någon form av kontroll för samtliga fält
                antingen via input-typ eller pattern.
            </p>
            <p>
                Som i implementationen av server i krav2 kan man fritt kombinera samtliga parametrar i ett filter.
                Det blev node/express även här. Fick lite problem med fetch-modulen men till slut hittade jag en
                lösning på nätet där man skulle installera node-fetch@2 för att kunna använda require-kommando.
            </p>
            <h3>Krav5 Mer data</h3>
            <p>
                I och med att jag redan tog upp allt från krav5 i tidigare punkter
                kommer jag ta upp docker/docker-compose här.
            </p>
            <p>
                Allt gick rätt så smidigt till tills jag försökte köra webbclient.
                Vad jag än gjorde ville den inte fungera. Jag kunde isolera problemet att portarna inte blev mappade.
                Det fingerade med manuell portmappning dvs. om jag ger -p direktiv men inte med yaml-filen.
                Efter en del men och om hittade jag till slut en lösning på nätet: man får köra
                docker-compse <strong>up</strong> och <strong>inte</strong> docker-compose run.
            </p>
            <h3>Generellt om projektet</h3>
            <p>
                Jag tyckte projektet var en bra avrundning av kursen där vi fick använda det mesta
                som vi gick igenom under kursen. Olika problem jag fick under projektet har jag redan tagit upp
                så jag kommer inte upprepa mig här.
            </p>
            <p>
                Generellt tyckte jag att den här kursen var relativt enkel jämfört med andra kurser
                men jag är inte en representativ student för jag har hållit på linux i halva mitt liv.
                Trots det var det en hel del utmaningar vilket var uppskattat. Personligen hade jag önskat
                mer djupdykning i docker, awk, kanske lite perl också.
            </p>
            <h3>Generellt om kursen</h3>
            <p>
                Allt i allo tyckte jag att det var en rolig kurs och för min del en liten uppfräschning av gamla verktyg
                plus en del nytt samt att jag äntligen fick lägga lite mer tid på att lära mig regex.
            </p>
            <p>
                Kursmaterialet var bra och man fick tips om en del intressanta nätbaseradeverktyg.
                Hade kursen tagit upp lite mer avancerade saker hade jag gett den en 10 utan det blev en 9 i stället.
            </p>
        </section>
    </article>
</main>

<?php
include("incl/byline.php");
include("incl/footer.php");
?>