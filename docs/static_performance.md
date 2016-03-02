#Benchmarks Before Optimization

### Grade C
#### Overall performance score 75   Ruleset applied: YSlow(V2)  
1. Grade F on Make fewer HTTP requests
..* This page has 18 external Javascript scripts. Try combining them into one.
..* This page has 6 external stylesheets. Try combining them into one.

2. Grade F on Use a Content Delivery Network (CDN)
..* There are 24 static components that are not on CDN.

3. Grade A on Avoid empty src or href

4. Grade C on Add Expires headers

5. Grade F on Compress components with gzip
..* There are 21 plain text components that should be sent compressed

6. Grade A on Put CSS at top

7. Grade F on Put JavaScript at bottom
..* There are 18 JavaScript scripts found in the head of the document

8. Grade A on Avoid CSS expressions

9. Grade n/a on Make JavaScript and CSS external

10. Grade A on Reduce DNS lookups

11. Grade C on Minify JavaScript and CSS
..* There are 3 components that can be minified

12. Grade A on Avoid URL redirects

13. Grade A on Remove duplicate JavaScript and CSS

14. Grade A on Configure entity tags (ETags)

15. Grade A on Make AJAX cacheable

16. Grade A on Use GET for AJAX requests

17. Grade A on Reduce the number of DOM elements

18. Grade A on Avoid HTTP 404 (Not Found) error

19. Grade A on Reduce cookie size

20. Grade F on Use cookie-free domains


#Benchmarks After Optimization

### Grade A
#### Overall performance score 95   Ruleset applied: YSlow(V2)  

1. Grade A on Make fewer HTTP requests

2. Grade A on Use a Content Delivery Network (CDN)

3. Grade A on Avoid empty src or href

4. Grade F on Add Expires headers

5. Grade B on Compress components with gzip

6. Grade A on Put CSS at top

7. Grade A on Put JavaScript at bottom

8. Grade A on Avoid CSS expressions

9. Grade n/a on Make JavaScript and CSS external

10. Grade A on Reduce DNS lookups

11. Grade A on Minify JavaScript and CSS

12. Grade A on Avoid URL redirects

13. Grade A on Remove duplicate JavaScript and CSS

14. Grade A on Configure entity tags (ETags)

15. Grade A on Make AJAX cacheable

16. Grade A on Use GET for AJAX requests

17. Grade A on Reduce the number of DOM elements

18. Grade A on Avoid HTTP 404 (Not Found) error

19. Grade A on Reduce cookie size

20. Grade A on Use cookie-free domains

21. Grade A on Avoid AlphaImageLoader filter

22. Grade A on Do not scale images in HTML

23. Grade A on Make favicon small and cacheable

#Questions 

1. What optimization techniques did you use?
    1. Minified CSS and JS 
    2. Moved JS to bottom of html files 
    3. Moved some static content to a CDN (Images are hosted on Amazon s3)
    4. Added expiring headers for static content to cache it locally. 
2. What tools did you use to test the performance of your product before and after optimizations made? Using no tools for this leg is not acceptable! More below.
    1. YSlow
3. What performance aspects have been improved (e.g., loading time, file size)? Please provide numbers, percentages, or letter grades.
    See above sections.
4. Are there any lingering potential performance issues?
    Expires headers were not implemented for the following files:
        1. application.css
        2. application.js
        3. favicon
