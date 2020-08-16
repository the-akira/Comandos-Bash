#!/bin/bash
recipient='gabrielfelippe90@gmail.com'
subject='Desenvolvimento de Software'
message='Vamos desenvolver um projeto juntos?'
`mail -s $subject $recipient <<< $message`
