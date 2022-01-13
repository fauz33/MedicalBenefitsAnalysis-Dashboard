box_voronoys <- function(texto, cor){
  HTML(paste('<div class = "box_voronoys" style = "border:1px solid', 
             cor, '; background-color: ', 
             cor, ';">', 
             h3(texto), '</div>'))
}

tab_voronoys <- function(texto, cor, id){
  HTML(paste0('<a id="', id,'" href="#" class="action-button">
                  <div class = "voronoys-block" style = "background-color:', cor, ';"> 
                    <span class = "name" style="font-size: 130%;text-align: center;">', texto, '</span>
                  </div></a>'))
}