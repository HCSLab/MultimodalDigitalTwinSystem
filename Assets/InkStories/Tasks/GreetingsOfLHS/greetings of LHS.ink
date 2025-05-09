// mission name: greetings of LHS
#after: greetings of registry

#name: 生命科学学院的问候
#description: 院长们在新生入学期间跑到了学校各处，受教务处老师之托，你需要找到他们。根据教务处老师的消息，生命科学院院长可能在<color=red>行政楼后山</color>。

=== func_start ===
#collidetrigger: LHS_dean_tmp
同学你好，我是生命与健康科学学院的院长叶德全。
*你好，您就是生命与健康科学学院院长吗？
啊呀，同学你好啊。是的是的，我是院长叶德全。
-
*院长好，教务处老师好像在找你呢
几点了啊……天啊，我出来了这么久，得赶紧回去了。今天可是新同学入学的日子。
-
+n
说起来，你也是新同学吗？
-
*是的
那你对生命科学学院有所了解吗，想听听一些有关生命科学学院内部各个专业的简介吗？
 **想
 好的->introduction
 **跳过
 哦？你可要想好了，如果你对生命科学学院有兴趣的话，跳过这些介绍，可能也会错过一些有用的<color=blue>信息</color>哦。
    ***确认跳过
    可惜，那我先回去了。以后如果想来找我的话，就去<color=red>RA</color>楼下。
    #enableNPC: LHS_dean
    #upd_description:你已经在<color=red>行政楼后山</color>找到了<color=red>生命科学学院院长</color>了。现在该去找剩下的院长了！
    #endstory
    ->END
    
=== ending ===
+n
那么，这就是生命科学学院的所有专业了。
-
+n
啊……说了这么久，也该回去了，新生入学的时候，我也得在场呢。
-
+n
以后如果想来找我的话，就去<color=red>RA</color>楼下。
-
*嗯嗯
#enableNPC: LHS_dean
#upd_description:你已经在<color=red>行政楼后山</color>找到了<color=red>生命科学学院院长</color>了。现在该去找剩下的院长了！
#endstory
->END

=== introduction ===
VAR flag = true
请问你是？
*本科生 -> undergraduate
*研究生 -> graduate

//本科生部分------------------------------------
== undergraduate ==
*生物信息学 ->undergraduate.BI
*生物医学工程 ->undergraduate.BME
* ->
    ~ flag = !flag
    {flag == false:
    ++n 
    那么你目前已经听完了理工学院<color=blue>本科生</color>所有专业的简介了。你还想要听一下<color=blue>研究生</color>的吗？（一旦要听，就要把所有研究生专业全部听完）
        +++是
        ->graduate
        +++不了，谢谢
        ->ending
    - else:
    ++n
    ->ending
    }
    
= BI
+n
本课程旨在让学生学习有关计算生物的知识和技术，了解基因体序列与生物分子结构与它们功能与动态的关系，培养学生分析研究的能力，以及促进科研成果转化，从而提升医疗保健水平。
-
+n
生物信息及计算生物的发展加强了我们对健康和疾病的理解。随着人类基因组计划完成，加上低成本的基因检测技术的推动，传统临床的研究亦扩展至数据处理及数据挖掘的领域；结构生物的进展也让计算机药物设计成为药物产业界不可或缺的工具。生物信息学是跨学科的课程，涵括分子生物、计算机科学、物理、化学、统计、数据科学。生物信息的计算方法已成为现代生物学的基石，探索生物系统的生命过程，与从生物大数据中挖掘新颖的生物现象。

-
+n
相对于一般的生物信息学课程，港中大（深圳）开设的课程将为学生提供针对性的训练，以回应学术界、政府及业界的需求。系统生物学、算法及生物医学数据库开发将是本课程的重点。本课程亦让学生有机会参与研究或业界机构的实习计划，实践研究工作。

-
+n
完成本课程后，学生将具备以下能力：
1) 掌握生物信息学的计算方法的理论与应用，计算方法涵盖计算机科学、物理科学与数据科学 。
2) 对分子生物学、遗传学与结构生物等有一个总体的了解。
-
+n
3) 掌握基因体序列分析、生物分子模拟与数据收集管理。
4) 提出对生物系统中的生物过程分析方法，并提出解决方案；及
5) 展现批判性与创造性的专业态度。
-
->undergraduate

= BME
+n
生物医学工程是透过在工程学、生物和医学领域进行的研究和教育改善人类健康，重点领域包括系统生物、细胞及组织工程、神经工程、计算生物、以及传感器、测试设备和微/纳米技术，前两年修读理工科目和生物医学工程基础科目；第三年修读与生物医学工程相关的常见核心问题；第四年学习其应用领域，为学生提供业界实践知识和进一步深造的基础。
-
->undergraduate


// 研究生部分-----------------------------------
== graduate ==
*生物科学硕士-博士 ->graduate.BS
*->
    ~ flag = !flag
    {flag == false:
    ++n 
    那么你目前已经听完了理工学院<color=blue>研究生</color>所有专业的简介了。你还想要听一下<color=blue>本科生</color>的吗？（一旦要听，就要把所有本科生专业全部听完）
        +++是
        ->undergraduate
        +++不了，谢谢
        ->ending
    - else:
    ++n
    ->ending
    }
    
= BS
+n
生物科学硕士-博士专业旨在教育和培养具有坚实学科基础的生物科学研究生，在所选领域具有专业知识。他们有望成为大学、研究机构和工业领域的领先学者和研究者。
-
+n
所涵盖的研究领域包括：生物化学、细胞生物学、癌症生物学、免疫学、神经生物学、药理学、遗传学、人类遗传学、生物物理学、发育生物学和/或计算和系统。具有硕士学位的申请人应申请攻读博士学位，而具有学士学位的申请人，可以申请攻读硕士学位或者博士学位。申请人应具有生物科学、化学和/或相关学科。
-
->graduate