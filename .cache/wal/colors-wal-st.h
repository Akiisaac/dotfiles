const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0c0c1b", /* black   */
  [1] = "#AE5672", /* red     */
  [2] = "#CA596B", /* green   */
  [3] = "#E16370", /* yellow  */
  [4] = "#FA857A", /* blue    */
  [5] = "#BA6D85", /* magenta */
  [6] = "#E77084", /* cyan    */
  [7] = "#c2c2c6", /* white   */

  /* 8 bright colors */
  [8]  = "#5b5b6f",  /* black   */
  [9]  = "#AE5672",  /* red     */
  [10] = "#CA596B", /* green   */
  [11] = "#E16370", /* yellow  */
  [12] = "#FA857A", /* blue    */
  [13] = "#BA6D85", /* magenta */
  [14] = "#E77084", /* cyan    */
  [15] = "#c2c2c6", /* white   */

  /* special colors */
  [256] = "#0c0c1b", /* background */
  [257] = "#c2c2c6", /* foreground */
  [258] = "#c2c2c6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
