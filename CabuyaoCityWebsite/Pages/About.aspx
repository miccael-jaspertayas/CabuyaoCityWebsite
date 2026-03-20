<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CabuyaoCityWebsite.Pages.About" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/About.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="AboutHeroContent" ContentPlaceHolderID="HeroContent" runat="server">
    <section class="about-hero text-center text-white d-flex flex-column justify-content-center">
        <div class="container pt-5">
            <h1 class="display-4 fw-bold">About Cabuyao City</h1>
            <p class="lead mb-0">Learn more about the Golden Bell of the South</p>
        </div>
    </section>
</asp:Content>

<asp:Content ID="AboutUsContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>

        <div class="container section-container">
            
            <section id="mission-vision">
                <h2 class="section-title">Mission and Vision</h2>
                <div class="row g-4 mt-2">
                    <div class="col-md-6">
                        <div class="mv-card h-100">
                            <h3 class="mt-0 mv-title">Our Vision</h3>
                            <p class="text-muted mb-0">
                                An entrepreneurial, industrialized, Progressive, service-driven and Environment-friendly Cabuyao with God-loving citizens
                            </p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mv-card h-100">
                            <h3 class="mt-0 mv-title">Our Mission</h3>
                            <p class="text-muted mb-0">
                                Upliftment of the quality of lives of Cabuyeños through the sustainable delivery of efficient and effective economic, educational, ecological, physical and all basic social and cultural services in an industrial and entrepreneurial community setting. 
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            <section id="history" class="mt-5">
                <h2 class="section-title">Historical Background</h2>
                <div class="text-muted mb-4">
                    <p>
                        Cabuyao is previously known as the "Richest Municipality in the Philippines". 
                        This was due to the fact of the large immigrants who work in the city. 
                        There are also lots of industrial estates in the city which include Nestle Philippines, 
                        Asia Brewery, Inc., San Miguel Corporation, Tanduay Distillers, Inc., Wyeth Philippines, Inc., 
                        Procter & Gamble Philippines, Light Industry and Science Park of the Philippines, 
                        and Malayan Colleges Laguna have established factories or are located in Cabuyao.
                    </p>

                    <p>
                        The name Cabuyao originated from the word Kabuyaw, a citrus tree growing abundantly in the area 
                        which was used by the natives in washing hair and later evolved as the town’s location reference. 
                        Adopted by Franciscan friars and Spanish officials, it replaced the town’s indigenous name of ‘Tabuko’. 
                        Declared by Miguel Lopez De Legazpi as an encomienda or town in 1571, Tabuko was then the center of government, 
                        composed originally of barangays Malabanan (Biñan City), Sta. Rosa de Lima (City of Santa Rosa), and Calamba (Calamba City).
                    </p>
                </div>

                <div class="accordion" id="historyAccordion">
        
                    <div class="accordion-item history-era border-0">
                        <h3 class="accordion-header" id="headingPrecolonial">
                            <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePrecolonial" aria-expanded="false" aria-controls="collapsePrecolonial">
                                Precolonial Era
                            </button>
                        </h3>
                        <div id="collapsePrecolonial" class="accordion-collapse collapse" aria-labelledby="headingPrecolonial">
                            <div class="accordion-body text-muted">
                                One of the biggest villages established in the western portion of the lake was "Tabuko" or "Hangganang Ilog" 
                                which means boundary in the native tongue. Tabuko had no definite boundary except for natural landmarks such 
                                as the mountain, hills and lake. The boundary of Tabuko reached the mountain range of Sungay on the west, 
                                Mount Makiling on the south, the lake of Ba-i on the east, and the large track of quicksand at Tunasan on the north.
                            </div>
                        </div>
                    </div>

                    <div class="accordion-item history-era border-0">
                        <h3 class="accordion-header" id="headingSpanish">
                            <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSpanish" aria-expanded="false" aria-controls="collapseSpanish">
                                Spanish Era
                            </button>
                        </h3>
                        <div id="collapseSpanish" class="accordion-collapse collapse" aria-labelledby="headingSpanish">
                            <div class="accordion-body text-muted">
                                In the summer of 1896, news spread over Cabuyao that the province of Cavite revolted against the Spanish government. 
                                Anticipating the disorder it would bring to the community, Lt. Isabelo Virtucio organized a volunteer group to fight 
                                against the Spanish government. He coordinated with the different leaders of the revolutionary groups, and his group 
                                joined the forces of General Paciano Rizal, the brother of the Philippines' national hero, José Rizal. The group adopted 
                                guerrilla warfare in fighting the Spaniards such as ambush, surprise attack and putting up traps on the roads used by the enemy. 
                                It took almost two years before the Spanish armed forces surrendered in 1898.
                            </div>
                        </div>
                    </div>

                    <div class="accordion-item history-era border-0">
                        <h3 class="accordion-header" id="headingAmerican">
                            <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseAmerican" aria-expanded="false" aria-controls="collapseAmerican">
                                American Era
                            </button>
                        </h3>
                        <div id="collapseAmerican" class="accordion-collapse collapse" aria-labelledby="headingAmerican">
                            <div class="accordion-body text-muted">
                                The next elected mayor of Cabuyao was Nicolas Limcaoco, who served from 1937 to 1940. 
                                The original 3-year term was amended by the constitution, which made the new term of elected mayor four years. 
                                His accomplishments included the construction of a road from Poblacion to Barangay Marinig, which shortened the travel time 
                                going to the different barangays along the coastal area of the town, and the installation of a water line from Matang Tubig 
                                at Casile to Poblacion. The project was completed in 1938 under the supervision of Jose L. Acuña who was elected as Mayor in 1941.
                            </div>
                        </div>
                    </div>

                    <div class="accordion-item history-era border-0">
                        <h3 class="accordion-header" id="headingJapanese">
                            <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseJapanese" aria-expanded="false" aria-controls="collapseJapanese">
                                Japanese Occupation
                            </button>
                        </h3>
                        <div id="collapseJapanese" class="accordion-collapse collapse" aria-labelledby="headingJapanese">
                            <div class="accordion-body text-muted">
                                In Cabuyao, there was no direct military confrontation between the Japanese soldiers and Filipinos. 
                                Confrontation did occur between the Makapili, a pro-Japanese group, and the guerrillas. 
                                The known guerrilla leaders of Cabuyao were Col. Nicolas Soriano, Maj. Amado Garcia, 
                                Maj. Romulo Alcasabas, Maj. Raymundo Tanchico, Maj. Placido Aragon, and Capt. Pablo Garcia.
                            </div>
                        </div>
                    </div>

                    <div class="accordion-item history-era border-0">
                        <h3 class="accordion-header" id="headingLiberation">
                            <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseLiberation" aria-expanded="false" aria-controls="collapseLiberation">
                                Liberation Period
                            </button>
                        </h3>
                        <div id="collapseLiberation" class="accordion-collapse collapse" aria-labelledby="headingLiberation">
                            <div class="accordion-body text-muted">
                                On the morning of September 21, 1944, the people of Cabuyao were surprised to hear the sound of American airplanes 
                                flying to Manila for bombing operations. On January 1, 1941, American forces, part of the 7th Army Corps under Gen. Krueger, 
                                arrived at Cabuyao. The first group of American soldiers was led by Capt. Brown, who made their camp at the church compound (Patio).
                                <br /><br />
                                Before the arrival of joint American and Philippine Commonwealth army soldiers to Cabuyao, the town was under the control 
                                of guerrillas under the leadership of Col. Nicolas Soriano. Thus, no military encounter occurred. The Americans readily established 
                                a provisionary government called the Philippine Civil Affairs Unit (PCAU) where Enrique Hemedes was appointed as head. 
                                The office was responsible for the distribution of food and clothing to the needy people of Cabuyao, with priority given to evacuees 
                                coming from nearby towns.
                                <br /><br />
                                After the arrival of the local Filipino troops of the 4th, 42nd and 47th Infantry Division of the Philippine Commonwealth Army 
                                and the 4th Constabulary Regiment of the Philippine Constabulary, Cabuyao was taken from the town municipalities and aided 
                                by the local guerrillas and U.S. troops against the Japanese.
                                <br /><br />
                                Emilio Tanchico replaced Hemedes. Tanchico was responsible for restoring the operations of the municipal government of Cabuyao, 
                                such as the Office of the Treasurer, Office of Police, Postal Office, Communication, and other offices. Nicolas Limcaoco then replaced him 
                                in the middle of 1946 and served until 1947.
                                <br /><br />
                                The first thing Limcaoco did was to establish peace and order in the locality. There were many loose firearms because of the recent war, 
                                which led to robberies, theft, killings, and other criminal offenses. He hired 10 "terong" (toughies) from the mountainous areas of Cabuyao 
                                and appointed them as policemen. Criminality was lessened and peace and order was maintained during that time in Cabuyao.
                            </div>
                        </div>
                    </div>

                    <div class="accordion-item history-era border-0">
                        <h3 class="accordion-header" id="headingPostWW2">
                            <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePostWW2" aria-expanded="false" aria-controls="collapsePostWW2">
                                Post World War II
                            </button>
                        </h3>
                        <div id="collapsePostWW2" class="accordion-collapse collapse" aria-labelledby="headingPostWW2">
                            <div class="accordion-body text-muted">
                                When the Philippines gained its Independence on July 4, 1946, a presidential election preceded it where President Manuel Roxas 
                                was elected as the first president of the Third Republic. The president appointed Jose L. Acuña as mayor of Cabuyao.
                                <br /><br />
                                Acuña restored the organizational set up of the Municipal Government of Cabuyao. He assisted the war veterans of Cabuyao in receiving 
                                their back pay, those whose properties were destroyed during the war in receiving war damage, and freed from jail people mistaken 
                                as Makapili or collaborators.
                                <br /><br />
                                In the 1947 local election, Lope B. Diamante was elected as mayor. Mauro H. Alimagno served for three terms: 1952–55, 1956–59 and 1960–63. 
                                Antonio Bailon served as mayor during the term 1964–67.
                                <br /><br />
                                Alimagno again served during the period 1968–71, 1972–79 and 1980. However, he failed to complete his last term as mayor in 1980 
                                as he was gunned down in Calamba. Vice Mayor Nicanor Alcasabas succeeded as mayor and served the remaining term. After the EDSA Revolution, 
                                Isidro T. Hildawa was appointed mayor of Cabuyao. However, he was later appointed as member of the Provincial Board of Laguna, 
                                so it was Constancio G. Alimagno, Jr. who was appointed as mayor on April 1, 1986.
                                <br /><br />
                                Proceso Aguillo was elected mayor of Cabuyao in the 1988 local election. Constancio G. Alimagno, Jr. served as mayor in 1992–95. 
                                Proceso Aguillo served as mayor from 1995 to 2004. Nila G. Aguillo, wife of Proceso Aguillo, assumed office until 2007. 
                                Isidro Hemedes, Jr., a relative of Enrique Hemedes, ascended into office from 2007 to 2016.
                            </div>
                        </div>
                    </div>

                    <div class="accordion-item history-era border-0">
                        <h3 class="accordion-header" id="headingCityhood">
                            <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCityhood" aria-expanded="false" aria-controls="collapseCityhood">
                                Cityhood
                            </button>
                        </h3>
                        <div id="collapseCityhood" class="accordion-collapse collapse" aria-labelledby="headingCityhood">
                            <div class="accordion-body text-muted">
                                On December 6, 2010 Laguna 2nd District Representative Timmy Chipeco filed House Bill No. 03811, 
                                or an Act Converting the Municipality of Cabuyao into a Component City of the Province of Laguna. 
                                The bill was referred to the Committee on Local Government dated December 13, 2010, and substituted to House Bill No. 4259. 
                                The Municipal Mayor as well as the residents of the town fully supported the measure and they looked forward to Cabuyao becoming a City 
                                since it was fully deserving and qualified. After the successful readings and committee hearings of the bill, both in the House of Congress 
                                and Senate, the bill was approved by the senate on January 16, 2012, the same date when Cabuyao celebrated its 441st Founding Anniversary.
                                <br /><br />
                                On May 16, 2012, President Benigno Aquino III approved House Bill No. 4259 or the Cabuyao City Charter and signed it into law 
                                by virtue of Republic Act No. 10163. On August 4, 2012, a plebiscite was held to ratify the conversion of the town into a city. 
                                A total of 24,670 Cabuyeños took part, 22,132 voters or 89.71% of the total number of voters voted "Yes" while the remaining 2,538 
                                or only 10.29% voted "No". The City of Cabuyao is the 142nd city in the Philippines and the 5th component city in Laguna besides 
                                San Pablo, Calamba, Santa Rosa, and Biñan.
                            </div>
                        </div>
                    </div>

                </div>
            </section>

            <section id="geographical-info" class="mt-5">
                <h2 class="section-title">Geographical Information</h2>
                <div class="row g-4 align-items-start mt-2">
                    <div class="col-lg-7 text-muted">
                        <p>
                            The City of Cabuyao is one of the six (6) component cities in the province of Laguna. 
                            It is located at the northern part of the province and is 43 kilometers away from Manila. 
                            The city’s longitude is 121.12472 East and latitude is 14.27833 North. 
                            It is bounded on the east by Laguna de Bay, on the west by the Cavite, 
                            on the north by Sta. Rosa and on the south by Calamba. 
                            The City of Cabuyao has 18 barangays: three are poblacion barangays, 
                            six are located along the national highway, six along Laguna de Bay 
                            and the remaining three are located on the western side near the Cabuyao-Cavite boundary. 
                            The city covers an area of 4,330 has which is broadly classified into agricultural and built-up areas.
                        </p>
                        <p>
                            Cabuyao is located 42 kilometers (26 mi) southeast of Metro Manila, at the western portion of Laguna. 
                            It is bordered by Santa Rosa City to the north, Laguna de Bay, the country's largest lake, to the east, 
                            Calamba to the south, and Silang, Cavite to the east. Cabuyao is 45 kilometers (28 mi) away from Santa Cruz, 
                            the provincial capital, and 8 kilometers (5.0 mi) from the city center of Calamba, the chartered city and 
                            regional center of Calabarzon region.
                        </p>
                        <p>
                            The only lake found in Cabuyao is Laguna de Bay. Barangays situated along the lake are Bigaa, Butong, 
                            Marinig, Gulod, Baclaran and Mamatid. Types of fish found in the lake are kanduli, biya, talapia, ayungin, 
                            hito, karpa, mamale, bangus, dalag, papalo, kakasuhet and dulong.The Cabuyao Fishing Port can be found in Barangay
                            Marinig where many Cabuyeños and Cabuyeñas take zumba every Saturday and Sunday as the sun rises.
                        </p>
                    </div>
                    <div class="col-lg-5 text-lg-end text-center">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/3/36/Map_of_Cabuyao.jpg" alt="Map of Cabuyao" class="img-fluid rounded shadow-sm" />
                    </div>
                </div>
            </section>

            <section id="barangays" class="mt-5">
                <h2 class="section-title">Barangays</h2>
                <p class="text-muted">Click on a barangay to view its officials and contact information:</p>
                
                <div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 g-4 mt-2 list-unstyled justify-content-center">
                    <asp:Repeater ID="rptBarangays" runat="server">
                        <ItemTemplate>
                            <div class="col">
                                <div class="card h-100 text-center shadow-sm hover-card">
                                    <div class="card-body d-flex flex-column">
                                        <img src='<%# ResolveUrl("~/Images/About/Barangay/" + Eval("LogoFileName")) %>' 
                                             alt='<%# Eval("BarangayName") %> Logo' 
                                             class="rounded-circle mb-3 border border-2 img-fluid mx-auto" 
                                             style="width:100px; height:100px; object-fit: contain;" 
                                             onerror="this.src='../Images/Master/cabuyao-logo.png';" />
                                        <h5 class="card-title text-success m-0 fs-6 fw-bold mb-3"><%# Eval("BarangayName") %></h5>
                                        
                                        <%-- Directs to ViewBrgyDetails.aspx with the specific BarangayID --%>
                                        <a href='ViewBrgyDetails.aspx?id=<%# Eval("BarangayID") %>' class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </section>

            <section id="departments" class="mt-5 mb-5">
                <h2 class="section-title">Departments</h2>
                <p class="text-muted">To serve our constituents effectively, the city operates through various offices:</p>
                
                <div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 g-4 mt-2 list-unstyled justify-content-center">
                    <asp:Repeater ID="rptDepartments" runat="server">
                        <ItemTemplate>
                            <div class="col">
                                <div class="card h-100 text-center shadow-sm hover-card">
                                    <div class="card-body">
                                        <%-- Assuming department logos are stored here. Adjust path if needed. --%>
                                        <img src='<%# ResolveUrl("~/Images/About/Department/" + Eval("LogoFileName")) %>' 
                                             alt='<%# Eval("DepartmentName") %> Logo' 
                                             class="rounded-circle mb-3 border border-2 img-fluid" 
                                             style="width:100px; height:100px; object-fit: contain;" 
                                             onerror="this.src='../Images/Master/cabuyao-logo.png';" />
                                        <h5 class="card-title text-success m-0 fs-6 fw-bold"><%# Eval("DepartmentName") %></h5>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </section>

        </div>
    </main>
</asp:Content>