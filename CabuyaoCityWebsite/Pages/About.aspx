<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CabuyaoCityWebsite.About" %>

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
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                            </p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mv-card h-100">
                            <h3 class="mt-0 mv-title">Our Mission</h3>
                            <p class="text-muted mb-0">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            <section id="history" class="mt-5">
                <h2 class="section-title">Historical Background</h2>
                <div class="text-muted mb-4">
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
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
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
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
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
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
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
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
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
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
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
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
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
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
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
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
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
                            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                            Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </p>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
                            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
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
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="Baclaran Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">Baclaran</h5><a href="ViewBrgyDetails.aspx?brgy=Baclaran" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="Banay-Banay Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">Banay-Banay</h5><a href="ViewBrgyDetails.aspx?brgy=Banay-Banay" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="Banlic Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">Banlic</h5><a href="ViewBrgyDetails.aspx?brgy=Banlic" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="Bigaa Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">Bigaa</h5><a href="ViewBrgyDetails.aspx?brgy=Bigaa" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="Butong Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">Butong</h5><a href="ViewBrgyDetails.aspx?brgy=Butong" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="Casile Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">Casile</h5><a href="ViewBrgyDetails.aspx?brgy=Casile" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="Diezmo Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">Diezmo</h5><a href="ViewBrgyDetails.aspx?brgy=Diezmo" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="Gulod Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">Gulod</h5><a href="ViewBrgyDetails.aspx?brgy=Gulod" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="Mamatid Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">Mamatid</h5><a href="ViewBrgyDetails.aspx?brgy=Mamatid" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="Marinig Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">Marinig</h5><a href="ViewBrgyDetails.aspx?brgy=Marinig" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="Niugan Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">Niugan</h5><a href="ViewBrgyDetails.aspx?brgy=Niugan" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="Pittland Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">Pittland</h5><a href="ViewBrgyDetails.aspx?brgy=Pittland" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="Pulo Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">Pulo</h5><a href="ViewBrgyDetails.aspx?brgy=Pulo" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="Sala Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">Sala</h5><a href="ViewBrgyDetails.aspx?brgy=Sala" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="San Isidro Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">San Isidro</h5><a href="ViewBrgyDetails.aspx?brgy=San-Isidro" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="Brgy I Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">Barangay I Poblacion</h5><a href="ViewBrgyDetails.aspx?brgy=Barangay-I-Poblacion" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="Brgy II Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">Barangay II Poblacion</h5><a href="ViewBrgyDetails.aspx?brgy=Barangay-II-Poblacion" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body d-flex flex-column"><img src="../Images/Master/cabuyao-logo.png" alt="Brgy III Logo" class="rounded-circle mb-3 border border-2 img-fluid mx-auto" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold mb-3">Barangay III Poblacion</h5><a href="ViewBrgyDetails.aspx?brgy=Barangay-III-Poblacion" class="btn btn-sm btn-cabuyao-outline mt-auto w-100 fw-bold">View Details</a></div></div></div>
                </div>
            </section>

            <section id="departments" class="mt-5 mb-5">
                <h2 class="section-title">Departments</h2>
                <p class="text-muted">To serve our constituents effectively, the city operates through various offices:</p>
                
                <div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 g-4 mt-2 list-unstyled justify-content-center">
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="BPLO Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">Business Permits and Licensing Office (BPLO)</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="CDRRMO Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">City Disaster Risk Reduction and Management Office (CDRRMO)</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="Youth Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">Cabuyao Youth Development Affairs Office</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="Vet Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">City Veterinary Office</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="Registrar Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">City Civil Registrar's Office</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="Agri Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">City Agricultural Office</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="Health Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">City Health Office</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="CSWDO Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">City Social Welfare and Development Office (CSWDO)</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="Treasurer Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">City Treasurer's Office</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="Assessor Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">City Assessor's Office</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="Eng Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">City Engineering Office</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="Plan Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">City Planning and Development Office</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="HR Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">City Human Resource Management Office</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="Legal Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">City Legal Office</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="Budget Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">City Budget Office</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="PESO Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">Public Employment Service Office (PESO)</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="Library Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">City Library</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="Police Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">Cabuyao City Police Station</h5></div></div></div>
                    <div class="col"><div class="card h-100 text-center shadow-sm hover-card"><div class="card-body"><img src="../Images/Master/cabuyao-logo.png" alt="Fire Logo" class="rounded-circle mb-3 border border-2 img-fluid" style="width:100px; height:100px;" /><h5 class="card-title text-success m-0 fs-6 fw-bold">Cabuyao City Fire Station</h5></div></div></div>
                </div>
            </section>

        </div>
    </main>
</asp:Content>