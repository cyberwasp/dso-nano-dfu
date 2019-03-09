/*;******************** (C) COPYRIGHT 2007 STMicroelectronics ******************

;* File Name          : cortexm3_macro.s\r

;* Author             : MCD Application Team\r

;* Version            : V1.0\r

;* Date               : 10/08/2007\r

;* Description        : Instruction wrappers for special Cortex-M3 instructions.                      

;*******************************************************************************

; THE PRESENT SOFTWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS

; WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE TIME.

; AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY DIRECT,

; INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE

; CONTENT OF SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING

; INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.

;******************************************************************************/

.cpu cortex-m3

.fpu softvfp   

.syntax unified

.thumb

.text   

/*; Exported functions*/

.globl __WFI

.globl __WFE

.globl __SEV

.globl __ISB 

.globl __DSB

.globl __DMB

.globl __SVC

.globl __MRS_CONTROL

.globl __MSR_CONTROL

.globl __MRS_PSP
.globl __MSR_PSP

.globl __MRS_MSP

.globl __MSR_MSP    

.globl __SETPRIMASK

.globl __RESETPRIMASK

.globl __SETFAULTMASK

.globl __RESETFAULTMASK

.globl __BASEPRICONFIG

.globl __GetBASEPRI

.globl __REV_HalfWord

.globl __REV_Word  



/*;*****************************************************************************

; Function Name  : __WFI\r

 ; Description    : Assembler function for the WFI instruction.\r

; Input          : None\r

 ; Return         : None\r

;******************************************************************************/

.thumb_func

__WFI: 



WFI

BX r14



/*;*****************************************************************************

; Function Name  : __WFE

; Description    : Assembler function for the WFE instruction.

; Input          : None\r
; Return         : None\r

 ;******************************************************************************/

  .thumb_func

   __WFE:

   

       WFE

       BX r14



  /*;*****************************************************************************

   ; Function Name  : __SEV\r

   ; Description    : Assembler function for the SEV instruction.\r

   ; Input          : None\r

   ; Return         : None\r

   ;******************************************************************************/

   .thumb_func

 __SEV:

  

  SEV

     BX r14



/*;*****************************************************************************

; Function Name  : __ISB\r

   ; Description    : Assembler function for the ISB instruction.\r

   ; Input          : None\r

   ; Return         : None\r

   ;******************************************************************************/

   .thumb_func

   __ISB:

   

       ISB

       BX r14



   /*;*****************************************************************************

   ; Function Name  : __DSB\r

   ; Description    : Assembler function for the DSB instruction.\r

  ; Input          : None\r

   ; Return         : None\r

   ;******************************************************************************/

   .thumb_func

 __DSB:

  

      DSB

      BX r14

  

  /*;*****************************************************************************

  ; Function Name  : __DMB\r

  ; Description    : Assembler function for the DMB instruction.\r

  ; Input          : None\r

  ; Return         : None\r

  ;******************************************************************************/

  .thumb_func

  __DMB:

  

      DMB

      BX r14



  /*;*****************************************************************************

  ; Function Name  : __SVC\r

  ; Description    : Assembler function for the SVC instruction.\r

  ; Input          : None\r

  ; Return         : None\r

  ;******************************************************************************/

  .thumb_func

  __SVC:

  

      SVC 0x01

      BX r14

  

  /*;*****************************************************************************

  ; Function Name  : __MRS_CONTROL\r

  ; Description    : Assembler function for the MRS instruction.\r

  ; Input          : None\r

  ; Return         : - r4 : Cortex-M3 CONTROL register value.\r

  ;******************************************************************************/

  .thumb_func

  __MRS_CONTROL:

  

    MRS  r0,control

    BX r14

  

  /*;*****************************************************************************

  ; Function Name  : __MSR_CONTROL\r

  ; Description    : Assembler function for the MSR instruction.\r

  ; Input          : - R0 : Cortex-M3 CONTROL register new value.  \r

  ; Return         : None\r

  ;******************************************************************************/

  .thumb_func

  __MSR_CONTROL:

  

 MSR control, r0

    ISB

    BX r14

  /*;*****************************************************************************

  ; Function Name  : __MRS_PSP\r

  ; Description    : Assembler function for the MRS instruction.\r

  ; Input          : None\r

  ; Return         : - r0 : Process Stack value.\r

  ;******************************************************************************/

  .thumb_func

  __MRS_PSP:

  

    MRS r0, psp

    BX r14

  

  /*;*****************************************************************************

  ; Function Name  : __MSR_PSP\r

  ; Description    : Assembler function for the MSR instruction.\r

  ; Input          : - r0 : Process Stack new value.  \r

  ; Return         : None\r

  ;******************************************************************************/

  .thumb_func

  __MSR_PSP:

   

      MSR psp,  r0      /* set Process Stack value*/

      BX r14

  

  /*;*****************************************************************************

  ; Function Name  : __MRS_MSP\r

  ; Description    : Assembler function for the MRS instruction.\r

  ; Input          : None\r

  ; Return         : - r0 : Main Stack value.\r

  ;******************************************************************************/

  .thumb_func

 __MRS_MSP:

  

    MRS r0, msp

    BX r14

  

  /*;*****************************************************************************

  ; Function Name  : __MSR_MSP\r

  ; Description    : Assembler function for the MSR instruction.\r

  ; Input          : - r0 : Main Stack new value.  \r

  ; Return         : None\r

  ;******************************************************************************/

  .thumb_func

  __MSR_MSP: 

   

      MSR msp, r0  /*; set Main Stack value*/

      BX r14

  /*;*****************************************************************************

  ; Function Name  : __SETPRIMASK\r

  ; Description    : Assembler function to set the PRIMASK.\r

  ; Input          : None \r

  ; Return         : None\r

  ;******************************************************************************/

  .thumb_func

  __SETPRIMASK:

  

    CPSID i

    BX r14

  

  /*;*****************************************************************************

  ; Function Name  : __RESETPRIMASK\r

  ; Description    : Assembler function to reset the PRIMASK.\r

  ; Input          : None \r

  ; Return         : None\r

  ;******************************************************************************/

  .thumb_func

  __RESETPRIMASK:

  

    CPSIE i

    BX r14

  

  /*;*****************************************************************************

  ; Function Name  : __SETFAULTMASK\r

  ; Description    : Assembler function to set the FAULTMASK.\r

  ; Input          : None \r

  ; Return         : None\r

  ;******************************************************************************/

  .thumb_func

  __SETFAULTMASK:

 

    CPSID f

    BX r14

  

  /*;*****************************************************************************

  ; Function Name  : __RESETFAULTMASK\r

  ; Description    : Assembler function to reset the FAULTMASK.\r

  ; Input          : None \r

  ; Return         : None\r

  ;******************************************************************************/

  .thumb_func

  __RESETFAULTMASK:

  

    CPSIE f

    BX r14

  

  /*;*****************************************************************************

  ; Function Name  : __BASEPRICONFIG\r

  ; Description    : Assembler function to set the Base Priority.\r

  ; Input          : - r0 : Base Priority new value  \r

  ; Return         : None\r

  ;******************************************************************************/

  .thumb_func

  __BASEPRICONFIG:

  

    MSR basepri, r0

    BX r14

  

  /*;*****************************************************************************

  ; Function Name  : __GetBASEPRI\r

  ; Description    : Assembler function to get the Base Priority value.\r

  ; Input          : None \r

  ; Return         : - r0 : Base Priority value \r

  ;******************************************************************************/

  .thumb_func

  __GetBASEPRI:

  

    MRS r0, basepri_max

    BX r14

  /*;*****************************************************************************

  ; Function Name  : __REV_HalfWord\r

  ; Description    : Reverses the byte order in HalfWord(16-bit) input variable.

  ; Input          : - r0 : specifies the input variable\r

  ; Return         : - r0 : holds tve variable value after byte reversing.\r

  ;******************************************************************************/

  .thumb_func

  __REV_HalfWord: 

   

    REV16 r0, r0

    BX r14

  

  /*;*****************************************************************************

  ; Function Name  : __REV_Word\r

  ; Description    : Reverses the byte order in Word(32-bit) input variable.

  ; Input          : - r0 : specifies the input variable\r

  ; Return         : - r0 : holds tve variable value after byte reversing.\r

  ;******************************************************************************/

  .thumb_func

  __REV_Word: 

   

    REV r0, r0

    BX r14

    

  .end  

  

    

  /*;*************** (C) COPYRIGHT 2007 STMicroelectronics *****END OF FILE******/
