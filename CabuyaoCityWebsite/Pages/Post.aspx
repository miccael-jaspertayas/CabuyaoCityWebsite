<%@ Page Title="News and Announcements" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Post.aspx.cs" Inherits="CabuyaoCityWebsite.Pages.Post" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/Post.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="PostHeroContent" ContentPlaceHolderID="HeroContent" runat="server">
    <section class="post-hero text-center text-white d-flex flex-column justify-content-center">
        <div class="container pt-5">
            <h1 class="display-4 fw-bold">News and Announcement</h1>
            <p class="lead mb-0">Stay updated with the latest happenings in the City of Cabuyao.</p>
        </div>
    </section>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>

        <section class="pb-5">
            <div class="row g-4">
                <asp:Repeater ID="rptAllNews" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-4 col-sm-6"> <div class="card h-100 news-card border-1 p-3">
                                <img src='<%# ResolveUrl("~/Images/NewsAnnouncement/" + Eval("ImageFileName")) %>' 
                                     class="card-img-top rounded mb-2" 
                                     style="height: 160px; object-fit: cover;" alt="News">
                                
                                <div class="card-body p-0 text-center">
                                    <div class="mb-2">
                                        <span class="badge category-badge text-uppercase"><%# Eval("Category") %></span>
                                    </div>
                                    <h6 class="news-card-title"><%# Eval("Title") %></h6>
                                    <p class="small text-muted mb-3">
                                        <%# Eval("Content").ToString().Length > 80 ? Eval("Content").ToString().Substring(0, 80) + "..." : Eval("Content") %>
                                    </p>
                                </div>
                                
                                <div class="card-footer bg-transparent border-0 p-0">
                                    <a href='<%# "ViewPostDetails.aspx?id=" + Eval("PostID") %>' class="btn-details w-100">View Details</a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </section>
    </main>
</asp:Content>
