<%@ Page Title="Barangay Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewBrgyDetails.aspx.cs" Inherits="CabuyaoCityWebsite.Pages.ViewBrgyDetails" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/ViewBrgyDetails.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="BrgyDetailsHeroContent" ContentPlaceHolderID="HeroContent" runat="server">
    <section class="brgy-details-hero text-center text-white d-flex flex-column justify-content-center">
        <div class="container pt-5">
            <h1 class="display-4 fw-bold">
                <asp:Literal ID="litHeroBrgyName" runat="server" Text="Barangay Name" />
            </h1>
        </div>
    </section>
</asp:Content>

<asp:Content ID="BrgyDetailsContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        
        <%-- REDESIGNED: About the Barangay (Overlapping Profile Card) --%>
        <div class="about-brgy-container position-relative" style="margin-top: -60px; z-index: 10;">
            <div class="mb-5 text-center">
                
                <%-- Logo pulled up to overlap the top border --%>
                <div class="d-flex justify-content-center">
                    <asp:Image ID="imgBrgyLogo" runat="server" CssClass="img-fluid brgy-logo-large shadow-sm rounded-circle bg-white" AlternateText="Barangay Logo" />
                </div>
                
                <h2 class="fw-bold text-cabuyao-green mt-3 mb-4">Contact Information</h2>
                
                <%-- Contact Info Cards Centered --%>
                <div class="row justify-content-center g-4 mx-auto">
                    <div class="col-sm-6 col-md-6">
                        <div class="contact-info-card bg-light rounded p-3 py-3 d-flex flex-column align-items-center h-100">
                            <div class="icon-box bg-white shadow-sm rounded-circle p-3 mb-2 text-cabuyao-gold">
                                <i class="fas fa-phone-alt fs-4"></i>
                            </div>
                            <small class="text-muted d-block text-uppercase fw-bold mb-1">Landline</small>
                            <asp:Label ID="lblLandline" runat="server" CssClass="fs-5 fw-semibold text-dark" Text="N/A" />
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="contact-info-card bg-light rounded p-3 py-3 d-flex flex-column align-items-center h-100">
                            <div class="icon-box bg-white shadow-sm rounded-circle p-3 mb-2 text-cabuyao-gold">
                                <i class="fas fa-mobile-alt fs-4"></i>
                            </div>
                            <small class="text-muted d-block text-uppercase fw-bold mb-1">Mobile Number</small>
                            <asp:Label ID="lblMobile" runat="server" CssClass="fs-5 fw-semibold text-dark" Text="N/A" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- REDESIGNED: Grid Barangay Officials List --%>
        <section class="container mb-5">
            <h3 class="fw-bold text-cabuyao-green section-title mb-4 text-center text-md-start pb-2">Barangay Officials</h3>
            
            <%-- Bootstrap Grid: 1 col on mobile, 2 on tablet, 3 on desktop, 4 on large screens --%>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 row-cols-xl-4 g-4 justify-content-center">
                <asp:Repeater ID="rptOfficials" runat="server">
                    <ItemTemplate>
                        <div class="col">
                            <div class="card official-grid-card h-100 text-center shadow-sm">
                                <div class="card-body d-flex flex-column">
                                    <%-- Centered Logo --%>
                                    <div class="official-logo-wrapper mb-3 mt-2">
                                        <img src='<%# ResolveUrl("~/Images/About/Barangay/" + Eval("LogoFileName")) %>' 
                                             class="official-grid-logo rounded-circle shadow-sm" 
                                             alt="Barangay Logo" 
                                             onerror="this.src='../Images/Master/placeholder.png';">
                                    </div>
                                    
                                    <%-- Official Details --%>
                                    <h5 class="fw-bold mb-1 text-dark"><%# Eval("FullName") %></h5>
                                    <h6 class="text-cabuyao-gold fw-bold small mb-3"><%# Eval("Position") %></h6>
                                    
                                    <%-- Push contact info to bottom if cards stretch --%>
                                    <div class="mt-auto pt-3 border-top w-100">
                                        <div class="d-flex flex-column gap-2 text-muted small">
                                            <span class="d-flex align-items-center justify-content-center text-truncate" title='<%# Eval("ContactNumber") %>'>
                                                <i class="fas fa-phone-alt me-2 text-cabuyao-green"></i> 
                                                <%# Eval("ContactNumber") %>
                                            </span>
                                            <span class="d-flex align-items-center justify-content-center text-truncate" title='<%# Eval("Email") %>'>
                                                <i class="fas fa-envelope me-2 text-cabuyao-green"></i> 
                                                <%# Eval("Email") %>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </section>
    </main>
</asp:Content>