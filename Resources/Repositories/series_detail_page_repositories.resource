*** Variables ***
# Header
${img_detail}                         //img[@class='responsive-image']
${lbl_title_detail}                   //h2[@class='default-title responsive-title w-100 mb-0']
${lbl_subtitle_detail}                //small[@class='text-muted d-block w-100']
${btn_favorite_detail}                //button[@class='btn btn-circle-icon btn-favorite']

# List Section
${pnl_list_season}                    //div[@class='container-fluid bg-block py-3 px-3 px-md-5 rounded-bottom-0'] 

# List Data Video
${pnl_list_episode}                   //div[@class='carusel-data-list']
${img_list_episode}                   //a//img[@class="responsive-image card-thumb-image is-live"]
${icn_view_list_episode}              //a//span[@class="far fa-eye"]
${lbl_name_list_episode}              //div[@class="carousel-card-text-block"]/h3
${lbl_subscribe_list_episode}         //span[@class='d-block text-truncate'][(contains(text(),'สมัครสมาชิก')) or (contains(text(),'Subscribe'))]
${lbl_view_list_episode}              //a//div[@class="text-nowrap ml-auto pr-1 card-thumb-add"]
${lst_carusel_data_column}            //div[contains(concat(' ',normalize-space(@class),' '),'carusel-data-column')]
${lbl_duration_time_list_detail}      //span[@class="duration-text"]
${icn_view_poster_detail}             //a//span[@class="far fa-eye"]





