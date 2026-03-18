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

    <style>
 
        * { box-sizing: border-box; }

        .gallery-hero {
            background: linear-gradient(rgba(0, 77, 0, 0.85), rgba(0, 77, 0, 0.85)), url('https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiwdKTIYbwS56DieYPNjeP2zK63mcIcbHmOywWDbtMdOMkXKJMzZv_zgK5LRI98W8qcXdZ4X-n0hZcH2xMvoDmfDoiqfmtNm-yF4iqDB6piv-tMRw3-D4QUp1nhHOHUDD3o6PmcuB5ePVo/s2046/St+Polycarp+Church+or+the+Old+Cabuyao+Church.jpg');
            background-size: cover;
            background-position: center;
            min-height: 350px;
        }

        .gallery-section {
            padding: 40px 20px;
        }

        .gallery-section h2 {
            color: #2E7D32;
            font-size: 1.5rem;
            border-bottom: 3px solid #2E7D32;
            padding-bottom: 8px;
            margin-bottom: 20px;
        }

        
        .slideshow-container {
            max-width: 900px;
            position: relative;
            margin: auto;
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid #c8e6c9;
            background-color: #f1f8e9;
        }

        .mySlides { display: none; }

        .slide-img {
            width: 100%;
            height: 320px;
            object-fit: cover;
            display: block;
        }

        .slide-body {
            padding: 15px 20px;
        }

        .slide-body h3 {
            color: #1B5E20;
            margin: 0 0 8px;
            font-size: 1.1rem;
        }

        .slide-body p {
            font-size: 0.9rem;
            color: #444;
            margin: 0;
            line-height: 1.5;
        }

        .festival-date {
            font-size: 0.8rem;
            color: #2E7D32;
            font-weight: bold;
            margin-bottom: 5px;
        }

        
        .numbertext {
            color: #fff;
            font-size: 12px;
            padding: 6px 12px;
            position: absolute;
            top: 0;
            left: 0;
            background-color: rgba(0,0,0,0.4);
            border-bottom-right-radius: 6px;
        }

        
        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 140px; 
            width: auto;
            padding: 14px 18px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: background-color 0.3s ease;
            border-radius: 0 4px 4px 0;
            background-color: rgba(0,0,0,0.35);
            user-select: none;
            text-decoration: none;
            z-index: 10;
        }

        .next {
            right: 0;
            border-radius: 4px 0 0 4px;
        }

        .prev:hover, .next:hover {
            background-color: rgba(46,125,50,0.85);
        }

        /* ── Dots ── */
        .dots-container {
            text-align: center;
            padding: 12px 0 4px;
        }

        .dot {
            cursor: pointer;
            height: 13px;
            width: 13px;
            margin: 0 4px;
            background-color: #c8e6c9;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.4s ease;
        }

        .dot.active, .dot:hover {
            background-color: #2E7D32;
        }

        /* ── Fade animation ── */
        .fade {
            animation-name: fadeAnim;
            animation-duration: 0.8s;
        }

        @keyframes fadeAnim {
            from { opacity: 0.4; }
            to   { opacity: 1; }
        }
    </style>

    <main>
        <%-- ══════════ TOURIST SPOTS SLIDESHOW ══════════ --%>
        <section id="tourist-spots" class="gallery-section">
            <h2>Tourist Spots</h2>

            <div class="slideshow-container" id="spots-slideshow">

                <div class="mySlides spots fade">
                    <span class="numbertext">1 / 6</span>
                    <asp:Image ID="imgSpot1" runat="server"
                        ImageUrl="https://placehold.co/900x320?text=Tourist+Spot+1"
                        AlternateText="Tourist Spot 1" CssClass="slide-img" />
                    <div class="slide-body">
                        <h3>Tourist Spot Name 1</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore.</p>
                    </div>
                </div>

                <div class="mySlides spots fade">
                    <span class="numbertext">2 / 6</span>
                    <asp:Image ID="imgSpot2" runat="server"
                        ImageUrl="https://placehold.co/900x320?text=Tourist+Spot+2"
                        AlternateText="Tourist Spot 2" CssClass="slide-img" />
                    <div class="slide-body">
                        <h3>Tourist Spot Name 2</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore.</p>
                    </div>
                </div>

                <div class="mySlides spots fade">
                    <span class="numbertext">3 / 6</span>
                    <asp:Image ID="imgSpot3" runat="server"
                        ImageUrl="https://placehold.co/900x320?text=Tourist+Spot+3"
                        AlternateText="Tourist Spot 3" CssClass="slide-img" />
                    <div class="slide-body">
                        <h3>Tourist Spot Name 3</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore.</p>
                    </div>
                </div>

                <div class="mySlides spots fade">
                    <span class="numbertext">4 / 6</span>
                    <asp:Image ID="imgSpot4" runat="server"
                        ImageUrl="https://placehold.co/900x320?text=Tourist+Spot+4"
                        AlternateText="Tourist Spot 4" CssClass="slide-img" />
                    <div class="slide-body">
                        <h3>Tourist Spot Name 4</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore.</p>
                    </div>
                </div>

                <div class="mySlides spots fade">
                    <span class="numbertext">5 / 6</span>
                    <asp:Image ID="imgSpot5" runat="server"
                        ImageUrl="https://placehold.co/900x320?text=Tourist+Spot+5"
                        AlternateText="Tourist Spot 5" CssClass="slide-img" />
                    <div class="slide-body">
                        <h3>Tourist Spot Name 5</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore.</p>
                    </div>
                </div>

                <div class="mySlides spots fade">
                    <span class="numbertext">6 / 6</span>
                    <asp:Image ID="imgSpot6" runat="server"
                        ImageUrl="https://placehold.co/900x320?text=Tourist+Spot+6"
                        AlternateText="Tourist Spot 6" CssClass="slide-img" />
                    <div class="slide-body">
                        <h3>Tourist Spot Name 6</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore.</p>
                    </div>
                </div>

                <a class="prev" onclick="plusSlides(-1, 0)">&#10094;</a>
                <a class="next" onclick="plusSlides(1, 0)">&#10095;</a>
            </div>

            <div class="dots-container" id="spots-dots">
                <span class="dot" onclick="currentSlide(1, 0)"></span>
                <span class="dot" onclick="currentSlide(2, 0)"></span>
                <span class="dot" onclick="currentSlide(3, 0)"></span>
                <span class="dot" onclick="currentSlide(4, 0)"></span>
                <span class="dot" onclick="currentSlide(5, 0)"></span>
                <span class="dot" onclick="currentSlide(6, 0)"></span>
            </div>
        </section>

        <%-- ══════════ FESTIVALS SLIDESHOW ══════════ --%>
        <section id="festivals" class="gallery-section">
            <h2>Festivals</h2>

            <div class="slideshow-container" id="fests-slideshow">

                <div class="mySlides fests fade">
                    <span class="numbertext">1 / 3</span>
                    <asp:Image ID="imgFest1" runat="server"
                        ImageUrl="https://placehold.co/900x320?text=Festival+1"
                        AlternateText="Festival 1" CssClass="slide-img" />
                    <div class="slide-body">
                        <div class="festival-date">Month Day - Day</div>
                        <h3>Festival Name 1</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore.</p>
                    </div>
                </div>

                <div class="mySlides fests fade">
                    <span class="numbertext">2 / 3</span>
                    <asp:Image ID="imgFest2" runat="server"
                        ImageUrl="https://placehold.co/900x320?text=Festival+2"
                        AlternateText="Festival 2" CssClass="slide-img" />
                    <div class="slide-body">
                        <div class="festival-date">Month Day</div>
                        <h3>Festival Name 2</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore.</p>
                    </div>
                </div>

                <div class="mySlides fests fade">
                    <span class="numbertext">3 / 3</span>
                    <asp:Image ID="imgFest3" runat="server"
                        ImageUrl="https://placehold.co/900x320?text=Festival+3"
                        AlternateText="Festival 3" CssClass="slide-img" />
                    <div class="slide-body">
                        <div class="festival-date">Month</div>
                        <h3>Festival Name 3</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore.</p>
                    </div>
                </div>

                <a class="prev" onclick="plusSlides(-1, 1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1, 1)">&#10095;</a>
            </div>

            <div class="dots-container" id="fests-dots">
                <span class="dot" onclick="currentSlide(1, 1)"></span>
                <span class="dot" onclick="currentSlide(2, 1)"></span>
                <span class="dot" onclick="currentSlide(3, 1)"></span>
            </div>
        </section>

    </main>

    <script>
        
        let slideIndex = [1, 1];
        let slideClasses = ["spots", "fests"];
        let dotsContainers = ["spots-dots", "fests-dots"];

        
        showSlides(1, 0);
        showSlides(1, 1);


        function plusSlides(n, no) {
            showSlides(slideIndex[no] += n, no);
        }

        function currentSlide(n, no) {
            showSlides(slideIndex[no] = n, no);
        }

        function showSlides(n, no) {
            let slides = document.getElementsByClassName(slideClasses[no]);
            let dots = document.getElementById(dotsContainers[no])
                           .getElementsByClassName("dot");

            if (n > slides.length) { slideIndex[no] = 1; }
            if (n < 1) { slideIndex[no] = slides.length; }

            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (let i = 0; i < dots.length; i++) {
                dots[i].classList.remove("active");
            }

            slides[slideIndex[no] - 1].style.display = "block";
            dots[slideIndex[no] - 1].classList.add("active");
        }
    </script>

</asp:Content>