[?03.?12.?2018 18:34]  Dieter Reimann:  
Hier ein Beispiel für eine nicht lösbare Aufgabe: 
 
[?03.?12.?2018 18:39]  Dieter Reimann:  
Kein Titel 
QUESTION 49

View the Exhibit and examine the structure of the PRODUCTS tables. You want to generate a report that displays the average list price of product categories where the average list price is less than half the maximum in each category.

Which query would give the correct output?



A.     SELECT prod_category,avg(prod_list_price)        FROM products
GROUP BY prod_category     HAVING avg(prod_list_price) < ALL  (SELECT ma:@prod_list_price)/2
FROM products   GROUP BY prod_category);


B.     SELECT prod_category,avg(prod_list_price)        FROM products
GROUP BY prod_category     HAVING avg(prod_list_price) > ANY   (SELECT ma:@prod_list_price)/2
FROM products   GROUP BY prod_category);



C.     SELECT prod_category,avg(prod_list_price)        FROM products
HAVING avg(prod_list_price) < ALL   (SELECT ma:@prod_list_price)/2
FROM products   GROUP BY prod_category);


D.     SELECT prod_category,avg(prod_list_price)        FROM products
GROUP BY prod_category     HAVING avg(prod_list_price) > ANY

(SELECT ma:@prod_list_price)/2 FROM products);

And the missing – and only correct Solution is: 

SELECT Prod_category,round(avg(prod_list_price),2) Lowest_Group_Price 
FROM products GROUP BY prod_category HAVING avg(prod_list_price) < ANY
    (SELECT ma:@prod_list_price)/2 FROM products );   
 
[?03.?12.?2018 18:46]  Dieter Reimann:  
Kein Titel 
QUESTION 49

View the Exhibit and examine the structure of the PRODUCTS tables. You want to generate a report that displays the average list price of product categories where the average list price is less than half the maximum in each category.

Which query would give the correct output?

A.     SELECT prod_category,avg ( prod_list_price )        FROM products   
GROUP BY prod_category     HAVING avg ( prod_list_price ) < ALL   
(SELECT max ( prod_list_price ) / 2   FROM products   GROUP BY prod_category ) ;



B.     SELECT prod_category,avg(prod_list_price)        FROM products   
GROUP BY prod_category     HAVING avg(prod_list_price) > ANY
(SELECT ma:@prod_list_price)/2   FROM products   GROUP BY prod_category);



C.     SELECT prod_category,avg(prod_list_price)        FROM products
HAVING avg(prod_list_price) < ALL   (SELECT max ( prod_list_price) / 2  
FROM products   GROUP BY prod_category);



D.     SELECT prod_category,avg(prod_list_price)        FROM products
GROUP BY prod_category     HAVING avg(prod_list_price) > ANY

(SELECT ma:@prod_list_price)/2 FROM products);

And the missing – and only correct Solution is:

SELECT Prod_category,round(avg(prod_list_price),2) Lowest_Group_Price 
FROM products GROUP BY prod_category HAVING avg(prod_list_price) < ANY
    (SELECT ma:@prod_list_price)/2 FROM products );  
 
[?03.?12.?2018 18:50]  Dieter Reimann:  
Kein Titel 
QUESTION 49

 

View the Exhibit and examine the structure of the PRODUCTS tables. You want to generate a report that displays the average list price of product categories where the average list price is less than half the maximum in each category.

 

Which query would give the correct output?

 

A.     SELECT prod_category,avg ( prod_list_price )        FROM products   

        GROUP BY prod_category     HAVING avg ( prod_list_price ) < ALL   

        (SELECT max ( prod_list_price ) / 2   FROM products   GROUP BY prod_category ) ;

 

 

 

B.     SELECT prod_category,avg(prod_list_price)        FROM products   

        GROUP BY prod_category     HAVING avg(prod_list_price) > ANY

       (SELECT max ( prod_list_price)/2   FROM products   GROUP BY prod_category);

 

 

 

C.     SELECT prod_category,avg(prod_list_price)        FROM products

        HAVING avg(prod_list_price) < ALL   (SELECT max ( prod_list_price) / 2  

        FROM products   GROUP BY prod_category);

 

 

 

D.     SELECT prod_category,avg(prod_list_price)        FROM products

        GROUP BY prod_category     HAVING avg(prod_list_price) > ANY 
       (SELECT max ( prod_list_price)/2 FROM products);



And the missing – and only correct - Solution is:

 

E.     SELECT Prod_category,round(avg(prod_list_price),2) Lowest_Group_Price 
        FROM products GROUP BY prod_category HAVING avg(prod_list_price) < ANY 
       (SELECT max ( prod_list_price)/2 FROM products );    
 
[?03.?12.?2018 19:53]  Dieter Reimann:  
Die Aufgaben sind extrem Komplex und 60 zu analysierende Zeilen sind keine Seltenheit und auch noch längst nicht das Maximum. 
 
[?03.?12.?2018 20:01]  Dieter Reimann:  
Von Aufbau der Aufgaben her, ist der Schwierigkeitgrad - obwohl es hier angeblich um SQL Fundementals geht - so hoch, dass man ohne weiteres Sagen kann: jede Ausgabe / Frage hat den Schwierigkeitsgrad von durchschnittlich 4 - 5 inkludierten Fragen. Oracle ist hier demnach der Meinung, das ein Absolvent der untersten Stufe der Qualifizierung 337,5 anspruchsvolle Fragen in 120 Minuten lösen können muss.  
Das sind 21,36 Sekunden pro Frage ! 
 
[?03.?12.?2018 20:02]  Dieter Reimann:  
Sorry, aber das ist nicht mehr normal, sondern durchgeknallt ! 
 
[?03.?12.?2018 20:03]  Dieter Reimann:  
Nehmen wir einmal an, Oracle findet es wichtig, ein hohes Niveau für diese Prüfungen anzusetzen; OK... 
 
[?03.?12.?2018 20:05]  Dieter Reimann:  
Ich denke, wenn 3 Bedingungen erfüllt sind:
1. Die Antworten sind insofern geprüft, als ein Zertifizierter Fach-Dozent sie jederzeit mit der Note 1 - 2 bestehen kann.  
2.  
 
[?03.?12.?2018 20:08]  Dieter Reimann:  
2. Die Antworten sind auf maximal 4 pro Frage beschränkt (Oracle liefert aktuell bis zu 7 Optionen) und es ist sichergestellt, dass die Antworten schlüssig und plausibel sind 
 
[?03.?12.?2018 20:10]  Dieter Reimann:  
3. Die Zeitvorgabe ist Diskiminierungsfrei und berücksichtigt den Umstand, dass es erwiesenermaßen Schnelldenke und Langsamdenker gibt. Und das bei mehreren möglichen Antworten jede richtige Antwort anteilig zählt.  
 
[?03.?12.?2018 20:11]  Dieter Reimann:  
Für Diskriminierungsfrei würde ich bei dem geforderten Niveau eine Vorgabe von mindesten 180 Minuten halten. 
 
