local module = {}
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local UIBlox = getrenv().require(CorePackages.UIBlox)
local StylePalette = getrenv().require(CorePackages.AppTempCommon.LuaApp.Style.StylePalette)
local Roact = getrenv().require(CorePackages.Roact)
local Images = getrenv().require(CorePackages.Packages._Index.UIBlox.UIBlox.App.ImageSet.Images)

function module.newToast(title, text, image, time)
    task.spawn(function()
        local guidname = game:GetService("HttpService"):GenerateGUID(false)
        UIBlox.init()
        local stylePalette = StylePalette.new()
        stylePalette:updateTheme("dark")
        stylePalette:updateFont("gotham")

        local Gui = Roact.createElement("ScreenGui", {
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Global
        }, {
        Gui = Roact.createElement(UIBlox.Core.Style.Provider, {
        style = stylePalette
        }, {
        Toast = Roact.createElement(UIBlox.App.Dialog.Toast, {
        toastContent = {
        toastTitle = title,
        toastSubtitle = text,
        iconImage = Images[image]
        }
        })
        })
        })

        Roact.mount(Gui, CoreGui, guidname)
        task.wait(time)
        game:GetService("CoreGui").guidname:Destroy()
    end)
end