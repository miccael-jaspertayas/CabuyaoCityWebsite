<%@ Page Title="Post Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewPostDetails.aspx.cs" Inherits="CabuyaoCityWebsite.Pages.ViewPostDetails" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/ViewPostDetails.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="PostDetailsHeroContent" ContentPlaceHolderID="HeroContent" runat="server">
    <section class="post-details-hero text-center text-white d-flex flex-column justify-content-center">
        <div class="container pt-5">
            <h1 class="display-4 fw-bold">News and Announcement</h1>
            <p class="lead mb-0">Stay updated with the latest happenings in the City of Cabuyao.</p>
        </div>
    </section>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <asp:Repeater ID="rptPostDetails" runat="server">
            <ItemTemplate>
                <article>
                    <header class="post-header">
                        <div class="post-meta mb-3">
                            <span class="post-category"><%# Eval("Category") %></span>
                            <span><i class="bi bi-calendar3 me-1"></i> <%# Eval("DateCreated", "{0:MMMM dd, yyyy}") %></span>
                        </div>
                        <h1 class="post-title"><%# Eval("Title") %></h1>
                    </header>

                    <div class="post-image-container">
                        <img src='<%# ResolveUrl("~/Images/NewsAnnouncement/" + Eval("ImageFileName")) %>' 
                                alt='<%# Eval("Title") %>' class="post-image" />
                    </div>

                    <div class="post-content">
                        <%# Eval("Content") %>
                    </div>
                </article>
            </ItemTemplate>
        </asp:Repeater>

        <asp:Panel ID="pnlError" runat="server" Visible="false" class="text-center py-5">
            <i class="bi bi-exclamation-circle display-1 text-muted mb-3"></i>
            <h3 class="text-muted">Oops! Post not found.</h3>
            <p>The announcement you are looking for might have been moved or deleted.</p>
            <button type="button" onclick="history.back();" class="btn btn-outline-cabuyao-green mt-3">
                Return to Previous Page
            </button>
        </asp:Panel>
    </main>

    <div class="text-center mt-5">
            <a href="Post.aspx" class="btn btn-outline-cabuyao-green">
            Browse More News & Announcements
        </a>
    </div>
</asp:Content>
