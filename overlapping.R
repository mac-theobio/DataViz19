library(grid)
library(gtable)
## https://stackoverflow.com/questions/40732543/seeking-workaround-for-gtable-add-grob-code-broken-by-ggplot-2-2-0
OverlappingStripLabels = function(plot) {

                                        # Get the ggplot grob
    g = ggplotGrob(plot)

### Collect some information about the strips from the plot
                                        # Get a list of strips
    strip = lapply(grep("strip-t", g$layout$name), function(x) {g$grobs[[x]]})

                                        # Number of strips
    NumberOfStrips = sum(grepl(pattern = "strip-t", g$layout$name))

                                        # Number of rows
    NumberOfRows = length(strip[[1]])

                                        # Panel spacing and it's unit
    plot_theme <- function(p) {
        plyr::defaults(p$theme, theme_get())
    }
    PanelSpacing = plot_theme(plot)$panel.spacing
    unit = attr(PanelSpacing, "unit")

                                        # Map the boundaries of the new strips
    Nlabel = vector("list", NumberOfRows)
    map = vector("list", NumberOfRows)
    for(i in 1:NumberOfRows) {

        for(j in 1:NumberOfStrips) {
            Nlabel[[i]][j] = getGrob(grid.force(strip[[j]][i]), gPath("GRID.text"), grep = TRUE)$label
        }

        map[[i]][1] = TRUE
        for(j in 2:NumberOfStrips) {
            map[[i]][j] = Nlabel[[i]][j] != Nlabel[[i]][j-1]
        }
    }



    ## Construct gtable to contain the new strip
                                        # Set the widths of the strips, based on widths of the panels and PanelSpacing
    panel = subset(g$layout, grepl("panel", g$layout$name), l, drop = TRUE)                       
    StripWidth = list()
    for(i in seq_along(panel)) StripWidth[[i]] = unit.c(g$width[panel[i]], PanelSpacing)

    newStrip  = gtable(widths = unit.c(unit(unlist(StripWidth), c("null", unit)))[-2*NumberOfStrips], 
                       heights = strip[[1]]$heights)


    ## Populate the gtable  
    seqLeft = list()
    for(i in 1:NumberOfRows) {  
        Left = which(map[[i]] == TRUE)
        seqLeft[[i]] = if((i-1) < 1) 2*Left - 1 else sort(unique(c(seqLeft[[i-1]], 2*Left - 1))) 
        seqRight = c(seqLeft[[i]][-1] -2, (2*NumberOfStrips-1))
        newStrip = gtable_add_grob(newStrip, lapply(strip[(seqLeft[[i]]+1)/2], `[`, i), t = i, l = seqLeft[[i]], r = seqRight)
    }

    ## Put the strip into the plot
                                        # Get the locations of the original strips
    pos = subset(g$layout, grepl("strip-t", g$layout$name), t:r)

    ## Use these to position the new strip
    pgNew = gtable_add_grob(g, newStrip, t = unique(pos$t), l = min(pos$l), r = max(pos$r))

    return(pgNew)
}
