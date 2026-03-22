<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CabuyaoCityWebsite.Home" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/Home.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="HomeHeroContent" ContentPlaceHolderID="HeroContent" runat="server">
    <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000" data-bs-pause="false">
        
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2"></button>
        </div>

        <div class="carousel-inner">
            <div class="carousel-item active">
                <section class="home-hero hero-slide-1 d-flex align-items-center justify-content-center text-center text-white">
                    <div class="hero-overlay"></div>
                    <div class="hero-text z-1">
                        <h1 class="display-1 fw-bold slide-in-top">Welcome to Cabuyao</h1>
                        <p class="fs-4 slide-in-bottom">Experience the Golden City</p>
                        <div class="mt-4">
                            <i class="bi bi-arrow-down-circle fs-1 animate-bounce"></i>
                        </div>
                    </div>
                </section>
            </div>

            <div class="carousel-item">
                <section class="home-hero hero-slide-2 d-flex align-items-center justify-content-center text-center text-white">
                    <div class="hero-overlay"></div>
                    <div class="hero-text z-1">
                        <h1 class="display-1 fw-bold slide-in-top">Rich in Heritage</h1>
                        <p class="fs-4 slide-in-bottom">Discover our history and culture</p>
                    </div>
                </section>
            </div>

            <div class="carousel-item">
                <section class="home-hero hero-slide-3 d-flex align-items-center justify-content-center text-center text-white">
                    <div class="hero-overlay"></div>
                    <div class="hero-text z-1">
                        <h1 class="display-1 fw-bold slide-in-top">Thriving Economy</h1>
                        <p class="fs-4 slide-in-bottom">Building a brighter future together</p>
                    </div>
                </section>
            </div>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</asp:Content>

<asp:Content ID="HomeContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>  
        <section id="news-hero" class="news-section force-full-width d-flex align-items-center py-5">
            <div class="container-fluid px-5"> 
                <div class="text-center mb-5 text-white">
                    <h2 class="fw-bold section-title">NEWS & ANNOUNCEMENTS</h2>
                    <hr class="title-underline mx-auto" style="width: 200px; border-top: 3px solid #fff;" />
                </div>

                <div class="row g-4 justify-content-center">
                    <asp:Repeater ID="rptNews" runat="server">
                        <ItemTemplate>
                            <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
                                <div class="card h-100 cabuyao-style-card shadow-sm">
                                    <img src='<%# ResolveUrl("~/Images/NewsAnnouncement/" + Eval("ImageFileName")) %>' 
                                         class="news-card-image" alt="News Image">
            
                                    <div class="card-body d-flex flex-column">
                                        <div class="text-center">
                                            <span class="news-badge">Announcement</span>
                                        </div>

                                        <h5 class="card-title text-center cabuyao-card-title">
                                            <%# Eval("Title") %>
                                        </h5>
                
                                        <p class="card-text text-muted text-center small mb-4">
                                            <%# Eval("Content").ToString().Length > 90 ? Eval("Content").ToString().Substring(0, 90) + "..." : Eval("Content") %>
                                        </p>
                
                                        <div class="mt-auto text-center">
                                            <a href='<%# "ViewPostDetails.aspx?id=" + Eval("PostID") %>' class="btn btn-outline-cabuyao-green w-100">
                                                View Details
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <div class="text-center mt-5">
                    <a href="Post.aspx" class="btn btn-outline-light px-5">See More</a>
                </div>
            </div>
        </section>
    </main>
</asp:Content>