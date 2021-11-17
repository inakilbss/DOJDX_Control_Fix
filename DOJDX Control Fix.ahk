#NoEnv
#Warn
SendMode Input

auto := false
shot := false

#IfWinActive, DodonpachiDX
{
	z::
		auto := true
		If (not shot) {
			Send {z down}
		}
	return
	
	z Up::
		auto := false
		Send {z up}
	return

	c::
		shot := true
		if (auto) {
			Send {z up}
			Sleep, 40 ; It seems a frame has to pass between Z release and V press to ensure a fast laser
		}
		if (shot = true) { ; Prevents small taps from turning into phantom holds
			Send {v down}
		}
	return
	
	c Up::
		shot := false
		Send {v up}
		if (auto) {
			Send {z down}
		}
	return
}