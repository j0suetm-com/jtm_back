package main

import "github.com/gin-gonic/gin"

func main() {
	rtr := gin.Default()
	rtr.GET("/ping", func (ctx *gin.Context) {
		ctx.JSON(200, gin.H{
			"message": "pong",
		})
	})

	rtr.Run()
}
