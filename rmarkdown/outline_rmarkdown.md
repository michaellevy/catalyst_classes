# R Markdown 

## Motivation

- Keep analyses and writing about analyses together
- Version control
- Multiple output formats
	- html_notebook vs. html_document
	- Word
	- pdf (requires TeX)
		- ViticultureNetworks.pdf (emphasize reproducability)
	- html format:
		output:
  			tufte::tufte_html: default
	- slides
	- michaellevy.name/blog -> ERGM tutorial
	- https://rstudio.github.io/tufte/
		- show how to set this option and switching
	- bookdown.org -> R for DS
- LaTeX equations
	- real-time preview
- Interactive elements

```r
library("leaflet")
leaflet() %>%
  addProviderTiles("OpenTopoMap") %>%
  addMarkers(lat = 40.632991, lng = -111.803945, label = "Us!")
```

## Details 

- .Rmd files
- Markdown basics
- Code chunks
- Keyboard shortcuts
	- cmd-opt-i
	- cmd-shift-enter
	- cmd-shift-k
- Options: Show output in viewer
- knitr -- possible outputs
- YAML
- Global environment vs. compilation environment
- Paths 
- Code chunk options
	- echo, eval, include
	- names
		- RStudio outline
	- fig.width, fig.asp
	- results
	- warning, messages
	- Advanced: root.dir
- tables
	- kable
		- caption, align
	- for control see htmlTable + others

