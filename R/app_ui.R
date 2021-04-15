#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinyMobile
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here
    f7Page(
      title = "partnR",
      preloader = FALSE,
      loading_duration = 3,
      options = list(
        theme = "auto",
        dark = TRUE,
        filled = FALSE,
        color = "#007aff",
        touch = list(tapHold = TRUE, tapHoldDelay = 750, iosTouchRipple = FALSE),
        iosTranslucentBars = FALSE,
        navbar = list(iosCenterTitle = TRUE, hideNavOnPageScroll = TRUE),
        toolbar = list(hideNavOnPageScroll = FALSE),
        pullToRefresh = FALSE
      ),
      allowPWA = TRUE,
      
      f7TabLayout(
        navbar = f7Navbar(
          subNavbar = NULL,
          title = "partnR",
          subtitle = NULL,
          hairline = TRUE,
          shadow = TRUE,
          bigger = FALSE,
          transparent = FALSE,
          left_panel = TRUE,
          right_panel = TRUE
        ),
        messagebar = f7MessageBar(inputId = "message_bar", placeholder = "MESSAGE BAR"),
        panels = tagList(
          f7Panel(
            id = "panel_left",
            title = "<-",
            side = "left",
            theme = "dark",
            effect = "cover",
            resizable = FALSE
          ),
          f7Panel(
            id = "panel_right",
            title = "->",
            side = "right",
            theme = "dark",
            effect = "cover",
            resizable = FALSE
          )
        ),
        appbar = f7Appbar(
          leftPanel = TRUE, rightPanel = TRUE, "app bar",
          f7Flex(f7Back(targetId = "tabset"), f7Next(targetId = "tabset")),
          f7Searchbar(id = "search1", inline = TRUE)
        ),
        f7Tabs(
          id = NULL,
          swipeable = FALSE,
          animated = TRUE,
          style = "toolbar",
          # "segmented", "strong"),
          f7Tab(
            tabName = "tabX",
            icon = f7Icon("person"),
            active = TRUE,
            "module here"
          )
        )
      )
      
    )
  )
}


#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
  
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'partnR'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

