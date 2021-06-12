
//list of anchors along chain
anchors = ds_list_create();
ds_list_add(anchors, pos(x, y));
ds_list_add(anchors, pos(x, y));
//the first anchor is always the o_rope_start object
//the last anchor is always the o_rope_end object

sensors = ds_list_create();

self.move = function (_x, _y) {
    x += _x;
    y += _y;
    //move anchor (self) to new location
    adjustAnchor(ds_list_size(anchors) - 1, pos(x, y))
}

self.adjustAnchor = function (ai, npos) {
    //An anchor has moved!
    
    var old = anchors[| ai]; //anchor original position
    
    //anchor new position
    ds_list_replace(anchors, ai, npos);
    
    //positions of previous and next anchors in chain
    var prev = ai >= 1 ? ai - 1 : -1;
    var next = ai < ds_list_size(anchors) - 1 ? ai + 1 : -1;
    
    if (prev != -1) {
        //check for collisions along previous link
        ropeCollide(prev, old, npos);
    }
    if (next != -1) {
        //check for collisions along following link
        ropeCollide(next, old, npos);
    }
}

self.addAnchor = function (bi, apos, o, t) {
    var angle = posang(apos, t); //angle from anchor to snag point
    var nanchor = {
        x : apos.x,
        y : apos.y,
        a : angle,
        dir : sign(angle - posang(apos, o)) //direction of snag
    }
    ds_list_insert(anchors, bi, nanchor);
}

self.ropeCollide = function (ai, oldpos, newpos) {
    print(ai, oldpos, newpos, "fuck")
    
    var anchor = anchors[| ai]; //current anchor point
    
    var adat = ang(oldpos, newpos);
    //angle and length from old to new points
    
    var l = 1;
    while (l <= adat.length) {
        print(l, adat.length, "going")
        
        //step from old point to new point
        var testpos = angpos(oldpos, adat.angle, l);
        print(testpos, "test")
        var tdat = ang(anchor, testpos);
        //angle and length from anchor to current test point
        
        
        //Is there a snag along this link?
        if (ai < ds_list_size(anchors) - 1) {
            var apos = pos(0, 0);
            var block = noone;
            for (var i = 0; i < tdat.length; i += precision) {
                print(i, tdat.length, "checking")
                
                //step from anchor to test point
                var cpos = angpos(testpos, tdat.angle, i);
                
                block = collision_point(cpos.x, cpos.y, o_rope_block, false, true);
                if (block != noone) {
                    //show_message(print(cpos, block, "hit"))
                    print(cpos, block, "hit")
                    //colliding with block
                    apos = cpos;
                    break;
                }
            }
            if (block != noone) {
                //add new anchor
                addAnchor(ai, apos, oldpos, testpos);
                //recalculate using new anchor
                show_message(print("snagbreak"))
                //ropeCollide(ai + 1, testpos, newpos);
                break;
            }
        }
        
        //Does Current Anchor need to unsnag?
        if (ai > 0 and ai < ds_list_size(anchors) - 1) {
            var dir = sign(anchor.a - tdat.angle);
            
            //crossed anchor boundry
            if (dir != anchor.dir) {
                print("unsnag")
                //remove anchor
                ds_list_delete(anchors, ai);
                //continue using previous anchor
                break;
                //continue;
            }
        }
        
        l++;
    }
    
}