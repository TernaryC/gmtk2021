frames = 0;

self.move = function (distance, angle) {
    //print("MOVING", distance, angle)
    //print("POSITION", x, y)
    
    for (var i = 0; i < distance; i++) {
        var v = vector(pos(x, y), angle, 1);
        //print("STEP", v.x, v.y)
        x = v.x;
        y = v.y;
        adjustAnchor(anchors_len - 1, pos(x, y));
    }
    //recordSnags(anchors_len - 1);
}

self.getSnag = function (i) {
    if (i + 1 > anchors_len - 1) return 0;
    if (i < 0) return 0;
    //var a = angle_from(anchors[| i], anchors[| i + 1]);
    var a = anchors[| i + 1].angle;
    //print("://getsnag/",i,"....FRAME:", frames)
    //print("/angle",anchors[| i].angle)
    //print("/a",a)
    //print("/dif",anchors[| i].angle - a)
    //print("")
    
    return sign(anchors[| i].angle - a);
}

self.recordSnags = function (i) {
    var s = i - 1 > 0 ? i - 1 : 0;
    for (var j = s; j < i; j++) {
        //print("://SNAGGING/",j,"of",i,"....FRAME:", frames);
        //print(j)
        var dir = getSnag(j);
        //print("/dir",dir);
        //if (dir != -1) //print(j, dir)
        var old = anchors[| j].dir;
        //print("/olda",anchors[| j].angle);
        //print("/old",old);
        if (old == 0) anchors[| j].dir = dir;
        else {
            if (dir != old) {
                //print("!!! CAUGHT SNAG:",j)
                //anchors[| j].dir = dir;
                removeAnchor(j);
            }
        }
        //print("\n")
    }
}

self.adjustAnchor = function (i, newpos) {
    //print("://ADJUSTING/",i,"to",newpos,"....FRAME:", frames);
    //print("\n")
    var oldpos = repos(anchors[| i]);
    
    anchors[| i].x = newpos.x;
    anchors[| i].y = newpos.y;
    realignAnchor(i);
    if (i > 0) realignAnchor(i - 1);
    if (i < anchors_len - 1) realignAnchor(i + 1);
    
    //check previous rope for collisions
    findSnags(i);
    //check next rope for collisions
    if (i < anchors_len - 1) findSnags(i + 1);
    
    recordSnags(i);
}

self.findSnags = function (i) {
    if (i > 0) {
        var anchor = anchors[| i];
        var anchor_prev = anchors[| i - 1];
        var length = pos_distance(anchor_prev, anchor);
        var angle = anchor.angle;
        //print()
        for (var l = 0; l < length; l++) {
            var v = vector(anchor_prev, angle, l);
            //draw_set_color(c_lime);
            //draw_circle(v.x, v.y, 2, true);
            var b = collision_point(v.x, v.y, o_rope_block, false, true);
            if (b != noone) {
                //draw_circle(v.x, v.y, 4, false);
                var cpos = b.getCorner(v);
                //print("://FINDING/",i,"....FRAME:",frames)
                //print("/anchor",anchor)
                //print("/prev",anchor_prev)
                //print("/length",length)
                //print("/l, v",l,", ",v)
                //print("//adding...",i,cpos)
                addAnchor(i, cpos, angle);
                break;
            }
        }
        //print("\n")
    }
}

self.removeAnchor = function (i) {
    //print("://REMOVING/",i,"....FRAME:",frames);
    //print("\n")
    if (i >= anchors_len || i < 0) return;
    ds_list_delete(anchors, i);
    anchors_len--;
    if (i > 0) realignAnchor(i)
    if (i < anchors_len - 1) realignAnchor(i + 1);
}

self.addAnchor = function (i, _pos, _angle) {
    if (_angle == undefined and i != 0)
        _angle = angle_from(anchors[| i - 1], _pos);
    else if (_angle == undefined)
        _angle = 0;
    var anchor = {
        x : _pos.x,
        y : _pos.y,
        angle : _angle,
        dir : 0
    }
    ds_list_insert(anchors, i, anchor);
    if (i <= anchors_len - 1) realignAnchor(i + 1);
    //if (i > 0) anchors[| i].dir = getSnag(i - 1);
    anchors_len++;
}

self.realignAnchor = function (i) {
    if (i - 1 < 0 or i >= anchors_len) return;
    var oldangle = anchors[| i].angle;
    
    var newangles = [0, 0, 0];
    newangles[0] = angle_from(anchors[| i - 1], anchors[| i]);
    newangles[1] = newangles[0] - two_pi;
    newangles[2] = newangles[0] + two_pi;
    
    var least = newangles[0]
    var record = abs(oldangle - newangles[0]);
    for (var j = 1; j <= 2; j++) {
        var test = abs(oldangle - newangles[j])
        if (test < record) {
            least = newangles[j];
            record = test;
        }
    }
    //record = newangles[0];
    //print("://REALIGN/",i,"....FRAME:", frames)
    //print("/node",i)
    if (i == anchors_len - 1) //print("/END")
    //print("/old:", oldangle)
    //print("/new:", newangles)
    //print("/dif:final ", record, ":", least)
    //print("\n")
    anchors[| i].angle = least;
    
    /*
    var difference = newangle - oldangle;
    if (sign(oldangle) != sign(newangle)) {
        if (abs(oldangle) > half_pi and abs(newangle) > half_pi) {
            var newold = oldangle + (2*pi);
            difference = newangle - newold;
        }
    }
    /**/
    
    //anchors[| i].angle = newangle;
}

//list of anchors along chain
anchors = ds_list_create();
var rs = instance_find(o_rope_start, 0);
anchors_len = 0;
addAnchor(0, pos(x, y));
addAnchor(1, pos(rs.x, rs.y));

init = false;
//the first anchor is always the o_rope_start object
//the last anchor is always the o_rope_end object

