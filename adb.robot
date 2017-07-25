*** Settings ***
Library           Process

*** Test Cases ***
Example
    ${handle} =    Process.Start Process    adb logcat -d
 

    ...    shell=yes
    ...    cwd=${OUTPUT_DIR}
    ...    stdout=${OUTPUT_DIR}/log.log
    ...    stderr=STDOUT

    ${result}=    Process.Wait For Process
    ...    handle=${handle}
    ...    on_timeout=kill
    ...    timeout=30 s

