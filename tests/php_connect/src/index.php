<?php
  function genstring($size)
  {
    $string = '';
    $charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-=~!@#$%^&*()_+<>?/.,;:"{}[]';
    for ($i = 0; $i < $size; $i++)
    {
      $string .= substr($charset, rand(0,90), 1);
    }
    return $string;
  }
  $redis1 = new Redis();
  $redis1->connect($_SERVER['REDIS1_HOST'], $_SERVER['REDIS1_PORT']);
  for($i = 64; $i < 65536; $i *= 2)
  {
    $in = genstring($i);
    $redis1->set("test".$i, $in);
    $out = $redis1->get("test".$i);
    if ($in == $out)
    {
      echo "$i match<br />\n";
    }
    else
    {
      echo "$i don't match<br />\n";
    }
  }
  $redis1->close();
  $redis2 = new Redis();
  $redis2->connect($_SERVER['REDIS2_HOST'], $_SERVER['REDIS2_PORT']);
  for($i = 64; $i < 65536; $i *= 2)
  {
    $in = genstring($i);
    $redis2->set("test".$i, $in);
    $out = $redis2->get("test".$i);
    if ($in == $out)
    {
      echo "$i match<br />\n";
    }
    else
    {
      echo "$i don't match<br />\n";
    }
  }
  $redis2->close();
  $redis3 = new Redis();
  $redis3->connect($_SERVER['REDIS3_HOST'], $_SERVER['REDIS3_PORT']);
  for($i = 64; $i < 65536; $i *= 2)
  {
    $in = genstring($i);
    $redis3->set("test".$i, $in);
    $out = $redis3->get("test".$i);
    if ($in == $out)
    {
      echo "$i match<br />\n";
    }
    else
    {
      echo "$i don't match<br />\n";
    }
  }
  $redis3->close();
?>