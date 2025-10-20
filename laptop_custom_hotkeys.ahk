#Requires AutoHotkey v2.0
#SingleInstance Force

; --- Volume Control ---
^Up::ChangeVolume(2)      ; Ctrl + Up → Volume Up
^Down::ChangeVolume(-2)   ; Ctrl + Down → Volume Down

; --- Brightness Control ---
^Right::AdjustScreenBrightness(5)  ; Ctrl + Right → Brightness Up
^Left::AdjustScreenBrightness(-5)  ; Ctrl + Left → Brightness Down

; ======================================================
; FUNCTIONS
; ======================================================

ChangeVolume(step) {
    vol := SoundGetVolume()
    newVol := Max(0, Min(100, Round(vol + step))) ; Round to integer
    SoundSetVolume newVol
    ShowOSD("🔊 Volume: " newVol "%")
}

AdjustScreenBrightness(step) {
    service := "winmgmts:{impersonationLevel=impersonate}!\\.\root\WMI"
    monitors := ComObjGet(service).ExecQuery("SELECT * FROM WmiMonitorBrightness WHERE Active=TRUE")
    monMethods := ComObjGet(service).ExecQuery("SELECT * FROM WmiMonitorBrightnessMethods WHERE Active=TRUE")
    minBrightness := 5

    for i in monitors {
        curt := i.CurrentBrightness
        break
    }
    if (curt < minBrightness)
        curt := minBrightness

    toSet := curt + step
    if (toSet > 100)
        toSet := 100
    if (toSet < minBrightness)
        toSet := minBrightness

    for i in monMethods {
        i.WmiSetBrightness(1, toSet)
        break
    }
    ShowOSD("💡 Brightness: " toSet "%")
}

ShowOSD(text) {
    static osd := ""
    if IsObject(osd)
        osd.Destroy()

    osd := Gui("+AlwaysOnTop -Caption +ToolWindow +Owner")
    osd.MarginX := 10
    osd.MarginY := 5
    osd.SetFont("s12 Bold", "Segoe UI") ; Smaller font
    osd.BackColor := "FFFFFF"            ; White background
    osd.AddText("Center c000000", text)  ; Black text

    ; Place near bottom of screen
    screenHeight := SysGet(1)
    yPos := screenHeight - 120
    osd.Show("xCenter y" yPos " NoActivate")
    SetTimer(() => osd.Hide(), -1000)
}
