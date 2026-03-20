<%@ Page Title="Gallery" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="CabuyaoCityWebsite.Pages.Gallery" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/Gallery.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="GalleryHeroContent" ContentPlaceHolderID="HeroContent" runat="server">
    <section class="gallery-hero text-center text-white d-flex flex-column justify-content-center">
        <div class="container pt-5">
            <h1 class="display-4 fw-bold">City Gallery</h1>
            <p class="lead mb-0">Discover the beauty of Cabuyao</p>
        </div>
    </section>
</asp:Content>

<asp:Content ID="GalleryContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <%-- ══════════ TOURIST SPOT SECTION ══════════ --%>

        <%-- ══════════ FESTIVAL SECTION ══════════ --%>

    </main>

</asp:Content>