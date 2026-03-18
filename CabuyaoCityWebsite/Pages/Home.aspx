<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CabuyaoCityWebsite.Home" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/Home.css" rel="stylesheet" /> 
</asp:Content>

<asp:Content ID="HomeHeroContent" ContentPlaceHolderID="HeroContent" runat="server">
    <section class="home-hero text-center text-white d-flex flex-column justify-content-center">
        <%--Note: Insert hero content for Home page here.--%>
    </section>
</asp:Content>

<asp:Content ID="HomeContent" ContentPlaceHolderID="MainContent" runat="server">
        <main>
            <%--Note: Insert markup for Home page content here.--%>
        </main>
</asp:Content>