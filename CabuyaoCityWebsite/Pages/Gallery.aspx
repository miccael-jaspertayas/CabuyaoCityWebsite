<%@ Page Title="Gallery" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="CabuyaoCityWebsite.Pages.Gallery" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/Gallery.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />
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

        <%-- TOURIST DESTINATIONS --%>
        <section>
            <div class="container">
                <h2 class="section-title mb-2">Tourist Destinations</h2>
                <p class="section-subtitle mb-5">Explore the landmarks and scenic spots of Cabuyao</p>

                <asp:Repeater ID="rptTouristSpots" runat="server" OnItemDataBound="rptAlbums_ItemDataBound">
                    <ItemTemplate>
                        <div class="location-block mb-5">
                            <h3 class="location-title"><%# Eval("Title") %></h3>
                            
                            <div class="row g-2">
                                <div class="col-md-6">
                                    <asp:Literal ID="litMainPhoto" runat="server"></asp:Literal>
                                </div>
                                
                                <div class="col-md-6">
                                    <div class="row g-2">
                                        <asp:Repeater ID="rptSubPhotos" runat="server">
                                            <ItemTemplate>
                                                <div class="col-6">
                                                    <div class="gallery-item" data-caption='<%# Eval("Title") %>' data-group='album-<%# Eval("AlbumID") %>' data-index='<%# Eval("ItemIndex") %>'>
                                                        <div class="gallery-img-wrapper">
                                                            <img src='../Images/Gallery/<%# Eval("ImageFileName") %>' alt='<%# Eval("Title") %>' class="gallery-img" onerror="this.src='../Images/Master/placeholder.png';" />
                                                        </div>
                                                        <div class="gallery-caption"><span><%# Eval("Title") %></span></div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </section>

        <%-- CITY EVENTS / FESTIVALS --%>
        <section>
            <div class="container">
                <h2 class="section-title mb-2">City Events</h2>
                <p class="section-subtitle mb-5">Relive the vibrant celebrations and activities of Cabuyao</p>

                <asp:Repeater ID="rptFestivals" runat="server" OnItemDataBound="rptAlbums_ItemDataBound">
                    <ItemTemplate>
                        <div class="location-block mb-5">
                            <h3 class="location-title"><%# Eval("Title") %></h3>
                            
                            <div class="row g-2">
                                <div class="col-md-6">
                                    <asp:Literal ID="litMainPhoto" runat="server"></asp:Literal>
                                </div>
                                <div class="col-md-6">
                                    <div class="row g-2">
                                        <asp:Repeater ID="rptSubPhotos" runat="server">
                                            <ItemTemplate>
                                                <div class="col-6">
                                                    <div class="gallery-item" data-caption='<%# Eval("Title") %>' data-group='album-<%# Eval("AlbumID") %>' data-index='<%# Eval("ItemIndex") %>'>
                                                        <div class="gallery-img-wrapper">
                                                            <img src='../Images/Gallery/<%# Eval("ImageFileName") %>' alt='<%# Eval("Title") %>' class="gallery-img" onerror="this.src='../Images/Master/placeholder.png';" />
                                                        </div>
                                                        <div class="gallery-caption"><span><%# Eval("Title") %></span></div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </section>

        <%-- LIGHTBOX --%>
        <div class="lightbox-overlay" id="lightboxOverlay" role="dialog" aria-modal="true" aria-label="Image Lightbox">
            <div id="lightboxBg" style="position:fixed;inset:0;z-index:1;pointer-events:none;"></div>
            <button type="button" class="lightbox-close" id="lightboxClose" aria-label="Close"><i class="bi bi-x-lg"></i></button>
            <button type="button" class="lightbox-nav lightbox-prev" id="lightboxPrev" aria-label="Previous"><i class="bi bi-chevron-left"></i></button>
            <button type="button" class="lightbox-nav lightbox-next" id="lightboxNext" aria-label="Next"><i class="bi bi-chevron-right"></i></button>
            
            <div class="lightbox-content" style="z-index:2;">
                <div class="lightbox-img-wrapper">
                    <img src="" alt="" id="lightboxImg" />
                    <div class="lightbox-no-img" id="lightboxNoImg" style="display:none;"><i class="bi bi-image"></i><span>No Image Available</span></div>
                </div>
                <div class="lightbox-caption" id="lightboxCaption"></div>
                <div class="lightbox-counter" id="lightboxCounter"></div>
            </div>
        </div>

        <script>
            var lightboxItems = [], currentIndex = 0;
            var overlay = document.getElementById('lightboxOverlay');
            var lbImg = document.getElementById('lightboxImg');
            var lbNoImg = document.getElementById('lightboxNoImg');
            var lbCaption = document.getElementById('lightboxCaption');
            var lbCounter = document.getElementById('lightboxCounter');

            function buildGroupItems(group) {
                lightboxItems = [];
                document.querySelectorAll('.gallery-item[data-group="' + group + '"]').forEach(function (item) {
                    var img = item.querySelector('.gallery-img');
                    lightboxItems.push({
                        src: img ? img.src : '',
                        alt: img ? img.alt : '',
                        caption: item.getAttribute('data-caption')
                    });
                });
            }

            function openLightbox(group, index) {
                buildGroupItems(group);
                currentIndex = index;
                showLightboxItem();
                overlay.classList.add('active');
                document.body.classList.add('lightbox-open');
            }

            function showLightboxItem() {
                var item = lightboxItems[currentIndex];
                lbImg.src = item.src;
                lbImg.alt = item.alt;
                lbImg.style.display = 'block';
                lbNoImg.style.display = 'none';
                lbCaption.textContent = item.caption;
                lbCounter.textContent = (currentIndex + 1) + ' / ' + lightboxItems.length;
            }

            function closeLightbox() {
                overlay.classList.remove('active');
                document.body.classList.remove('lightbox-open');
                setTimeout(() => { lbImg.src = ''; }, 300); // Clear after fade out
            }

            function prevItem() { currentIndex = (currentIndex - 1 + lightboxItems.length) % lightboxItems.length; showLightboxItem(); }
            function nextItem() { currentIndex = (currentIndex + 1) % lightboxItems.length; showLightboxItem(); }

            // Event Delegation for dynamic items
            document.addEventListener('click', function (e) {
                var item = e.target.closest('.gallery-item');
                if (item && item.hasAttribute('data-index')) {
                    openLightbox(item.getAttribute('data-group'), parseInt(item.getAttribute('data-index')));
                }
            });

            document.getElementById('lightboxClose').addEventListener('click', function (e) { e.stopPropagation(); closeLightbox(); });
            document.getElementById('lightboxPrev').addEventListener('click', function (e) { e.stopPropagation(); prevItem(); });
            document.getElementById('lightboxNext').addEventListener('click', function (e) { e.stopPropagation(); nextItem(); });
        </script>

    </main>
</asp:Content>