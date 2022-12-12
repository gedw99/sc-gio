package service

import (
	"github.com/maxence-charriere/go-app/v9/pkg/app"
	"go-app/goapp/compo"
)

func Entry() {
	compo.Routes()
	app.RunWhenOnBrowser()
}
