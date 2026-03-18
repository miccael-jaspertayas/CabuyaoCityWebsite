<%@ Page Title="Officials" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Officials.aspx.cs" Inherits="CabuyaoCityWebsite.Pages.Officials" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/Officials.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="OfficialsHeroContent" ContentPlaceHolderID="HeroContent" runat="server">
    <section class="officials-hero text-center text-white d-flex flex-column justify-content-center">
        <div class="container pt-5">
            <h1 class="display-4 fw-bold">Government Officials</h1>
            <p class="lead mb-0">Meet the dedicated leaders serving our community</p>
        </div>
    </section>
</asp:Content>

<asp:Content ID="OfficialsContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        
        <%-- Executive Officials Section --%>
        <div class="row justify-content-center g-4 mb-5">
            <div class="col-12 mb-2">
                <h2 class="section-title">Executive Officials</h2>
            </div>
            
            <%-- City Mayor Card --%>
            <div class="col-12 col-xl-6">
                <div class="card official-card exec-card h-100">
                    <div class="row g-0 align-items-center h-100">
                        <div class="col-12 col-md-4 exec-img-col h-100">
                            <div class="official-img-container h-100 w-100">
                                <img src="../Images/Officials/official-placeholder.png" class="img-fluid h-100 w-100 object-fit-cover" alt="City Mayor">
                            </div>
                        </div>
                        <div class="col-12 col-md-8">
                            <div class="card-body p-4 h-100 d-flex flex-column justify-content-center">
                                <h4 class="fw-bold mb-1 exec-name text-uppercase">HON. DENNIS FELIPE C. HAIN</h4>
                                <h6 class="text-cabuyao-gold fw-bold mb-3">City Mayor</h6>
                                
                                <ul class="text-muted mb-0 official-details-list small">
                                    <li>Lorem ipsum dolor amet, consectetur</li>
                                    <li>Lorem dolor sit amet, consectetur adipiscing elit ipsum dolor sit amet</li>
                                    <li>Ipsum sit amet, consectetur adipiscing elit</li>
                                    <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- City Vice Mayor Card --%>
            <div class="col-12 col-xl-6">
                <div class="card official-card exec-card h-100">
                    <div class="row g-0 align-items-center h-100">
                        <div class="col-12 col-md-4 exec-img-col h-100">
                            <div class="official-img-container h-100 w-100">
                                <img src="../Images/Officials/official-placeholder.png" class="img-fluid h-100 w-100 object-fit-cover" alt="City Vice Mayor">
                            </div>
                        </div>
                        <div class="col-12 col-md-8">
                            <div class="card-body p-4 h-100 d-flex flex-column justify-content-center">
                                <h4 class="fw-bold mb-1 exec-name text-uppercase">HON. JAIME ONOFRE BATALLONES</h4>
                                <h6 class="text-cabuyao-gold fw-bold mb-3">City Vice Mayor</h6>
                                
                                <ul class="text-muted mb-0 official-details-list small">
                                    <li>Lorem ipsum dolor amet, consectetur</li>
                                    <li>Lorem dolor sit amet, consectetur adipiscing elit ipsum dolor sit amet</li>
                                    <li>Ipsum sit amet, consectetur adipiscing elit</li>
                                    <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- Sangguniang Panlungsod Section --%>
        <div class="row g-4 mb-5 justify-content-center">
            <div class="col-12 mb-4">
                <h2 class="section-title">Sangguniang Panlungsod</h2>
                <div class="mx-auto"></div>
            </div>

            <% for (int i = 1; i <= 10; i++) { %>
            <div class="col-xl-2-4 col-lg-3 col-md-4 col-sm-6">
                <div class="card official-card h-100">
                    <div class="official-img-container small-img">
                        <img src="../Images/Officials/official-placeholder.png" class="card-img-top" alt="Council Member">
                    </div>
                    <div class="card-body text-center p-3">
                        <h6 class="fw-bold mb-1 text-uppercase">Hon. Member Name <%= i %></h6>
                        <small class="text-muted d-block">City Councilor</small>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </main>
</asp:Content>