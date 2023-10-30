*** Variables ***
${lbl_result_for}                    //h1[@class="default-title mb-3"]/span[not(@class="search-result-not-query-overflowed")]
${lbl_result_for_value}              //h1[@class="default-title mb-3"]/span[@class="search-result-not-query-overflowed"]
${pnl_section_movie}                 //h2[contains(@class, 'default-title') and normalize-space(text())="Movies"]
${lbl_movie_name}                    (//h3[contains(@class, 'carousel-card-title')])
${lbl_title_name}                    //h3[@class="default-title"]/span[normalize-space(text())]