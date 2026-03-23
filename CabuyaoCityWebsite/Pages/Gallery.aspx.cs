using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CabuyaoCityWebsite.Pages
{
    public partial class Gallery : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGallery();
            }
        }

        // Load all albums and bind them to the respective repeaters based on their category
        private void LoadGallery()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // Fetch all albums
                string query = "SELECT AlbumID, Title, Category FROM GalleryAlbum ORDER BY Title";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dtAlbums = new DataTable();
                da.Fill(dtAlbums);

                // Filter and bind Tourist Spots
                DataView dvTourist = new DataView(dtAlbums);
                dvTourist.RowFilter = "Category = 'Tourist Spot'";
                rptTouristSpots.DataSource = dvTourist;
                rptTouristSpots.DataBind();

                // Filter and bind Festivals
                DataView dvFestival = new DataView(dtAlbums);
                dvFestival.RowFilter = "Category = 'Festival'";
                rptFestivals.DataSource = dvFestival;
                rptFestivals.DataBind();
            }
        }

        // This runs for EVERY album to bind its specific images
        protected void rptAlbums_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int albumId = Convert.ToInt32(drv["AlbumID"]);
                string title = drv["Title"].ToString();

                Literal litMainPhoto = (Literal)e.Item.FindControl("litMainPhoto");
                Repeater rptSubPhotos = (Repeater)e.Item.FindControl("rptSubPhotos");

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT ImageFileName FROM GalleryImage WHERE AlbumID = @AlbumID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@AlbumID", albumId);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dtImages = new DataTable();
                    da.Fill(dtImages);

                    if (dtImages.Rows.Count > 0)
                    {
                        string safeTitle = title.Replace("'", "&#39;");
                        string mainImg = dtImages.Rows[0]["ImageFileName"].ToString();

                        // Render the first image as the large Main Photo
                        litMainPhoto.Text = $@"
                            <div class='gallery-item main-gallery-item' data-caption='{safeTitle}' data-group='album-{albumId}' data-index='0'>
                                <div class='gallery-img-wrapper'>
                                    <img src='../Images/Gallery/{mainImg}' alt='{safeTitle}' class='gallery-img' onerror=""this.src='../Images/Master/placeholder.png';"" />
                                </div>
                                <div class='gallery-caption'><span>{title}</span></div>
                            </div>";

                        // If there are more images, bind them to the sub-photos repeater
                        if (dtImages.Rows.Count > 1)
                        {
                            DataTable dtSub = new DataTable();
                            dtSub.Columns.Add("ImageFileName");
                            dtSub.Columns.Add("ItemIndex", typeof(int));
                            dtSub.Columns.Add("AlbumID", typeof(int));
                            dtSub.Columns.Add("Title");

                            for (int i = 1; i < dtImages.Rows.Count; i++)
                            {
                                dtSub.Rows.Add(dtImages.Rows[i]["ImageFileName"], i, albumId, safeTitle);
                            }

                            rptSubPhotos.DataSource = dtSub;
                            rptSubPhotos.DataBind();
                        }
                    }
                    else
                    {
                        // Fallback if an album exists but has 0 images
                        litMainPhoto.Text = $@"
                            <div class='gallery-item main-gallery-item' style='pointer-events: none;'>
                                <div class='no-image-placeholder'>
                                    <i class='bi bi-image'></i>
                                    <span>No images available</span>
                                </div>
                            </div>";
                    }
                }
            }
        }
    }
}