/mob/living/carbon/monkey/examine(mob/user)

	var/msg = "<span class='info'>*---------*\nThis is [icon2html(src, user)] \a <EM>[src]</EM>!\n"

	if (src.handcuffed)
		msg += "It is [icon2html(handcuffed, user)] handcuffed!\n"
	if (src.wear_mask)
		msg += "It has [icon2html(wear_mask, user)] \a [src.wear_mask] on its head.\n"
	if (src.l_hand)
		msg += "It has [icon2html(l_hand, user)] \a [src.l_hand] in its left hand.\n"
	if (src.r_hand)
		msg += "It has [icon2html(r_hand, user)] \a [src.r_hand] in its right hand.\n"
	if (src.back)
		msg += "It has [icon2html(back, user)] \a [src.back] on its back.\n"
	if (src.stat == DEAD)
		msg += "<span class='deadsay'>It is limp and unresponsive, with no signs of life.</span>\n"
	else
		msg += "<span class='warning'>"
		if (src.getBruteLoss())
			if (src.getBruteLoss() < 30)
				msg += "It has minor bruising.\n"
			else
				msg += "<B>It has severe bruising!</B>\n"
		if (src.getFireLoss())
			if (src.getFireLoss() < 30)
				msg += "It has minor burns.\n"
			else
				msg += "<B>It has severe burns!</B>\n"
		if (src.fire_stacks > 0)
			msg += "It's covered in something flammable.\n"
		if (src.fire_stacks < 0)
			msg += "It's soaked in water.\n"

		if (src.stat == UNCONSCIOUS)
			msg += "It isn't responding to anything around it; it seems to be asleep.\n"
		msg += "</span>"

	if(chestburst == 2)
		msg += "<span class='warning'><b>It has a big hole in its chest!</b></span>\n"

	msg += "*---------*</span>"

	to_chat(user, msg)
	return