.syntax unified
.cpu cortex-m4
.thumb

  .global asm_tmvp16x16_SB_acc
  .type asm_tmvp16x16_SB_acc,%function
  .align 2
  asm_tmvp16x16_SB_acc:   
  push {lr}
 
  //---------------1
  
  ldr r3, [r1, #0]
  ldr.w r4, [r1, #4]
  ldr.w r5, [r1, #8]
  ldr.w r6, [r2, #28]
  ldr.w r7, [r2, #24]
  ldr.w r8, [r2, #20]
  ldr.w r9, [r2, #16]
  ldrh.w r10, [r0, #0]
  ldrh.w r11, [r0, #2]
  ldrh.w r12, [r0, #4]
  ldrh.w r14, [r0, #6]
  
  smladx r10, r3, r6, r10
  smladx r10, r4, r7, r10
  smladx r10, r5, r8, r10
  
  smladx r12, r4, r6, r12
  smladx r12, r5, r7,r12
  
  pkhtb r3, r3, r4
  pkhtb r4, r4, r5
  
  smlad r11, r3, r6, r11
  smlad r11, r4, r7, r11
  
  smlad r14, r4, r6, r14
  
  ldr.w r3, [r1, #12]
  ldr.w r4, [r1, #16]
  
  smladx r10, r3, r9, r10
  smladx r12, r3, r8, r12
  smladx r12, r4, r9, r12
  
  pkhtb r5, r5, r3
  pkhtb r3, r3, r4
 
  
  smlad r11, r5, r8, r11
  smlad r11, r3, r9, r11
  
  smlad r14, r5, r7, r14
  smlad r14, r3, r8, r14
  
   ldr.w r5, [r1, #20]  
   pkhbt r3, r5, r4   
  
  smlad r14, r3, r9, r14
  
  ldr.w r6, [r2, #12]
  ldr.w r7, [r2, #8]
  ldr.w r8, [r2, #4]
  ldr.w r9, [r2, #0]
 
  
  
  smladx r10, r4, r6, r10
  smladx r10, r5, r7, r10
  smladx r12, r5, r6, r12
  smlad r11, r3, r6, r11
  
  ldr.w r3, [r1, #24]
  ldr.w r4, [r1, #28]
  pkhbt r5, r3, r5
  
  smladx r10, r3, r8, r10
  smladx r10, r4, r9, r10
  smladx r12, r3, r7, r12
  smladx r12, r4, r8, r12
  
  pkhbt r3, r4, r3
  
  smlad r11, r5, r7, r11
  smlad r11, r3, r8, r11
  smlad r14, r5, r6, r14
  smlad r14, r3, r7, r14
  
  ldr.w r5, [r1, #32]
  ldr.w r3, [r1, #34]
  pkhbt r4, r5, r4
  
  smladx r12, r5, r9, r12
  smlad r11, r4, r9, r11
  smlad r14, r4, r8, r14
  smladx r14, r3, r9, r14
  
  
 
  pkhbt r10, r10, r11, lsl #16  
  pkhbt r12, r12, r14, lsl #16
  str.w r10, [r0, #0]
  str.w r12, [r0, #4] 

 //----------------------2  
  ldrh.w r10, [r0, #8]
  ldrh.w r11, [r0, #10]
  ldrh.w r12, [r0, #12]
  ldrh.w r14, [r0, #14]
  
  smladx r14, r3, r7, r14
  smlad r14, r4, r6, r14
  smladx r11, r3, r8, r11
  smlad r11, r4, r7, r11
  
  smladx r12, r5, r7, r12
  smladx r10, r5, r8, r10
  
  ldr.w r4, [r1, #38]
  ldr.w r5, [r1, #42]
  
  smladx r11, r4, r9, r11
  smladx r14, r4, r8, r14
  smladx r14, r5, r9, r14
  
  pkhbt r3, r4, r3
  pkhbt r4, r5, r4
  
  smlad r10, r3, r9, r10
  smlad r12, r3, r8, r12
  smlad r12, r4, r9, r12
  
  ldr.w r3, [r1, #28]
  ldr.w r4, [r1, #24]
  
  smladx r10, r3, r7, r10
  smladx r10, r4, r6, r10
  smladx r12, r3, r6, r12
  
  pkhbt r3, r3, r4
  
  smlad r11, r3, r6, r11
  
  ldr.w r6, [r2, #28]
  ldr.w r7, [r2, #24]
  ldr.w r8, [r2, #20]
  ldr.w r9, [r2, #16]
  ldr.w r5, [r1, #20]
  
  smladx r10, r5, r9, r10
  smladx r12, r4, r9, r12
  smladx r12, r5, r8, r12
  
  smlad r14, r3, r9, r14
  
  pkhbt r3, r4, r5
  ldr.w r4, [r1, #16]
  pkhbt r5, r5, r4
  
  smlad r11, r3, r9, r11
  smlad r11, r5, r8, r11
  smlad r14, r3, r8, r14
  smlad r14, r5, r7, r14
  smladx r10, r4, r8, r10
  smladx r12, r4, r7, r12
  
  ldr.w r3, [r1, #12]
  ldr.w r5, [r1, #8]
  
  smladx r10, r3, r7, r10
  smladx r10, r5, r6, r10
  smladx r12, r3, r6, r12
  
  pkhbt r5, r3, r5
  pkhbt r3, r4, r3
  
  smlad r11, r3, r7, r11
  smlad r11, r5, r6, r11
  smlad r14, r3, r6, r14
  
  pkhbt r10, r10, r11, lsl #16
  pkhbt r12, r12, r14, lsl #16
  
  str.w r10, [r0, #8]
  str.w r12, [r0, #12]
  
    //---------------3
  
  ldrh.w r10, [r0, #16]
  ldrh.w r11, [r0, #18]
  ldrh.w r12, [r0, #20]
  ldrh.w r14, [r0, #22]
  
  ldr.w r3, [r1, #20]
  ldr.w r5, [r1, #24]
  
  smladx r10, r4, r6, r10
  smladx r10, r3, r7, r10
  smladx r10, r5, r8, r10
  
  smladx r12, r3, r6, r12
  smladx r12, r5, r7,r12
  
  pkhbt r4, r3, r4
  pkhtb r3, r3, r5
  
  smlad r11, r4, r6, r11
  smlad r11, r3, r7, r11
  
  smlad r14, r3, r6, r14
  
  ldr.w r3, [r1, #28]
  ldr.w r4, [r1, #32]
  
  smladx r10, r3, r9, r10
  smladx r12, r3, r8, r12
  smladx r12, r4, r9, r12
  
  pkhtb r5, r5, r3
  pkhtb r3, r3, r4
 
  
  smlad r11, r5, r8, r11
  smlad r11, r3, r9, r11
  
  smlad r14, r5, r7, r14
  smlad r14, r3, r8, r14
  
   ldr.w r5, [r1, #36]  
   pkhbt r3, r5, r4   
  
  smlad r14, r3, r9, r14
  
  ldr.w r6, [r2, #12]
  ldr.w r7, [r2, #8]
  ldr.w r8, [r2, #4]
  ldr.w r9, [r2, #0]

  
  
  smladx r10, r4, r6, r10
  smladx r10, r5, r7, r10
  smladx r12, r5, r6, r12
  smlad r11, r3, r6, r11
  
  ldr.w r3, [r1, #40]
  ldr.w r4, [r1, #44]
  
  smladx r10, r3, r8, r10
  smladx r10, r4, r9, r10
  smladx r12, r3, r7, r12
  smladx r12, r4, r8, r12
  
  pkhbt r5, r3, r5
  pkhbt r3, r4, r3
  
  smlad r11, r5, r7, r11
  smlad r11, r3, r8, r11
  smlad r14, r5, r6, r14
  smlad r14, r3, r7, r14
  
  ldr.w r5, [r1, #48]
  ldr.w r3, [r1, #50]
  pkhbt r4, r5, r4
  
  smladx r12, r5, r9, r12
  smlad r11, r4, r9, r11
  smlad r14, r4, r8, r14
  smladx r14, r3, r9, r14
  
  
 
  pkhbt r10, r10, r11, lsl #16  
  pkhbt r12, r12, r14, lsl #16
  str.w r10, [r0, #16]
  str.w r12, [r0, #20] 

 //----------------------4
  ldrh.w r10, [r0, #24]
  ldrh.w r11, [r0, #26]
  ldrh.w r12, [r0, #28]
  ldrh.w r14, [r0, #30]
  
  smladx r14, r3, r7, r14
  smlad r14, r4, r6, r14
  smladx r11, r3, r8, r11
  smlad r11, r4, r7, r11
  
  smladx r12, r5, r7, r12
  smladx r10, r5, r8, r10
  
  ldr.w r4, [r1, #54]
  ldr.w r5, [r1, #58]
  
  smladx r11, r4, r9, r11
  smladx r14, r4, r8, r14
  smladx r14, r5, r9, r14
  
  pkhbt r3, r4, r3
  pkhbt r4, r5, r4
  
  smlad r10, r3, r9, r10
  smlad r12, r3, r8, r12
  smlad r12, r4, r9, r12
  
  ldr.w r3, [r1, #44]
  ldr.w r4, [r1, #40]
  
  smladx r10, r3, r7, r10
  smladx r10, r4, r6, r10
  smladx r12, r3, r6, r12
  
  pkhbt r3, r3, r4
  
  smlad r11, r3, r6, r11
  
  ldr.w r6, [r2, #28]
  ldr.w r7, [r2, #24]
  ldr.w r8, [r2, #20]
  ldr.w r9, [r2, #16]
  ldr.w r5, [r1, #36]
  
  smladx r10, r5, r9, r10
  smladx r12, r4, r9, r12
  smladx r12, r5, r8, r12
  
  smlad r14, r3, r9, r14
  
  pkhbt r3, r4, r5
  ldr.w r4, [r1, #32]
  pkhbt r5, r5, r4
  
  smlad r11, r3, r9, r11
  smlad r11, r5, r8, r11
  smlad r14, r3, r8, r14
  smlad r14, r5, r7, r14
  smladx r10, r4, r8, r10
  smladx r12, r4, r7, r12
  
  ldr.w r3, [r1, #28]
  ldr.w r5, [r1, #24]
  
  smladx r10, r3, r7, r10
  smladx r10, r5, r6, r10
  smladx r12, r3, r6, r12
  
  pkhbt r5, r3, r5
  pkhbt r3, r4, r3
  
  smlad r11, r3, r7, r11
  smlad r11, r5, r6, r11
  smlad r14, r3, r6, r14
  
  pkhbt r10, r10, r11, lsl #16
  pkhbt r12, r12, r14, lsl #16
  
  str.w r10, [r0, #24]
  str.w r12, [r0, #28]
 
  pop {pc} 
  
  .global CMF_64_22
  .type CMF_64_22, %function
  .align 2
  CMF_64_22:  
  push {r1, lr} 
  sub sp, sp, #384
  add.w r14, r1, #32
  two_tmvp2_eval_A_loop:
  ldr r4, [r1, #32]
  ldr.w r5, [r1, #64]
  ldr.w r6, [r1, #96]
  ldr.w r7, [r1, #128]
  ldr.w r8, [r1, #160]
  ldr.w r9, [r1, #192]
  ldr.w r10, [r1, #224]
  ldr.w r3, [r1], #4
  cmp r14, r1
  usub16 r11, r5, r6
  usub16 r12, r6, r7
  usub16 r10, r8, r10
  usub16 r9, r7, r9
  usub16 r3, r3, r5
  usub16 r4, r4, r6
  usub16 r5, r5, r7
  usub16 r6, r6, r8
  usub16 r7, r7, r8
  str.w r11, [sp], #4
  str.w r12, [sp, #28]
  str.w r7, [sp, #60]
  str.w r4, [sp, #92]
  str.w r5, [sp, #124]
  str.w r6, [sp, #156]
  str.w r9, [sp, #188]
  usub16 r3, r3, r4
  usub16 r4, r4, r5
  usub16 r5, r5, r6
  usub16 r6, r6, r9
  usub16 r9, r9, r10
  str.w r3, [sp, #220]
  str.w r4, [sp, #252]
  str.w r5, [sp, #284]
  str.w r6, [sp, #316]
  str.w r9, [sp, #348]
  bne two_tmvp2_eval_A_loop  
  
  sub.w sp, #32
  add.w r1, r1, #64  	
  bl asm_tmvp16x16_SB_acc			// S1
  
  mov r1, sp				
  add.w r2, r2, #32	
  add.w r0, r0, #32  
  bl asm_tmvp16x16_SB_acc			// S2
  
  add.w r1, r1, #32				
  add.w r2, r2, #32				
  add.w r0, r0, #32
  bl asm_tmvp16x16_SB_acc			// S3
  
  add.w r1, r1, #64
  add.w r2, r2, #32
  add.w r0, r0, #32
  bl asm_tmvp16x16_SB_acc			// S4  
  
  add.w r1, r1, #64	 
  add.w r2, r2, #32  
  add.w r0, r0, #32
  bl asm_tmvp16x16_SB_acc			// S5

  add.w r1, r1, #64  
  add.w r2, r2, #32  
  add.w r0, r0, #32
  bl asm_tmvp16x16_SB_acc			// S6

  add.w r1, r1, #32
  add.w r2, r2, #32
  add.w r0, r0, #32
  bl asm_tmvp16x16_SB_acc			// S7
  
  add.w r1, r1, #32				
  add.w r2, r2, #32				
  add.w r0, r0, #32
  bl asm_tmvp16x16_SB_acc			// S8
  
  add.w r1, r1, #32				
  add.w r2, r2, #32				
  add.w r0, r0, #32
  bl asm_tmvp16x16_SB_acc			// S9
  
  add.w sp, #384
  pop {r1, pc}

 
 
  .global CMF_256_422
  .type CMF_256_422, %function
  .align 2
  CMF_256_422:  
  push {r4-r11, lr}
  sub.w sp, #1792  
  
    //-- 1

  ldr r3, [r1, #0]
  ldr r4, [r1, #128]
  ldr r5, [r1, #256]
  ldr r6, [r1, #384]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1408]
  str.w r10, [sp, #1280]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #0]
  str.w r14, [sp, #1664]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1536]
  str.w r14, [sp, #128]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #256]
  str.w r8, [sp, #384]
  str.w r9, [sp, #512]
  str.w r11, [sp, #640]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #768]
  str.w r7, [sp, #896]
  str.w r12, [sp, #1024]
  str.w r8, [sp, #1152]
  //-- 2

  ldr r3, [r1, #4]
  ldr r4, [r1, #132]
  ldr r5, [r1, #260]
  ldr r6, [r1, #388]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1412]
  str.w r10, [sp, #1284]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #4]
  str.w r14, [sp, #1668]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1540]
  str.w r14, [sp, #132]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #260]
  str.w r8, [sp, #388]
  str.w r9, [sp, #516]
  str.w r11, [sp, #644]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #772]
  str.w r7, [sp, #900]
  str.w r12, [sp, #1028]
  str.w r8, [sp, #1156]
  //-- 3

  ldr r3, [r1, #8]
  ldr r4, [r1, #136]
  ldr r5, [r1, #264]
  ldr r6, [r1, #392]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1416]
  str.w r10, [sp, #1288]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #8]
  str.w r14, [sp, #1672]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1544]
  str.w r14, [sp, #136]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #264]
  str.w r8, [sp, #392]
  str.w r9, [sp, #520]
  str.w r11, [sp, #648]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #776]
  str.w r7, [sp, #904]
  str.w r12, [sp, #1032]
  str.w r8, [sp, #1160]
  //-- 4

  ldr r3, [r1, #12]
  ldr r4, [r1, #140]
  ldr r5, [r1, #268]
  ldr r6, [r1, #396]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1420]
  str.w r10, [sp, #1292]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #12]
  str.w r14, [sp, #1676]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1548]
  str.w r14, [sp, #140]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #268]
  str.w r8, [sp, #396]
  str.w r9, [sp, #524]
  str.w r11, [sp, #652]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #780]
  str.w r7, [sp, #908]
  str.w r12, [sp, #1036]
  str.w r8, [sp, #1164]
  //-- 5

  ldr r3, [r1, #16]
  ldr r4, [r1, #144]
  ldr r5, [r1, #272]
  ldr r6, [r1, #400]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1424]
  str.w r10, [sp, #1296]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #16]
  str.w r14, [sp, #1680]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1552]
  str.w r14, [sp, #144]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #272]
  str.w r8, [sp, #400]
  str.w r9, [sp, #528]
  str.w r11, [sp, #656]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #784]
  str.w r7, [sp, #912]
  str.w r12, [sp, #1040]
  str.w r8, [sp, #1168]
  //-- 6

  ldr r3, [r1, #20]
  ldr r4, [r1, #148]
  ldr r5, [r1, #276]
  ldr r6, [r1, #404]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1428]
  str.w r10, [sp, #1300]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #20]
  str.w r14, [sp, #1684]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1556]
  str.w r14, [sp, #148]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #276]
  str.w r8, [sp, #404]
  str.w r9, [sp, #532]
  str.w r11, [sp, #660]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #788]
  str.w r7, [sp, #916]
  str.w r12, [sp, #1044]
  str.w r8, [sp, #1172]
  //-- 7

  ldr r3, [r1, #24]
  ldr r4, [r1, #152]
  ldr r5, [r1, #280]
  ldr r6, [r1, #408]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1432]
  str.w r10, [sp, #1304]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #24]
  str.w r14, [sp, #1688]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1560]
  str.w r14, [sp, #152]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #280]
  str.w r8, [sp, #408]
  str.w r9, [sp, #536]
  str.w r11, [sp, #664]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #792]
  str.w r7, [sp, #920]
  str.w r12, [sp, #1048]
  str.w r8, [sp, #1176]
  //-- 8

  ldr r3, [r1, #28]
  ldr r4, [r1, #156]
  ldr r5, [r1, #284]
  ldr r6, [r1, #412]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1436]
  str.w r10, [sp, #1308]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #28]
  str.w r14, [sp, #1692]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1564]
  str.w r14, [sp, #156]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #284]
  str.w r8, [sp, #412]
  str.w r9, [sp, #540]
  str.w r11, [sp, #668]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #796]
  str.w r7, [sp, #924]
  str.w r12, [sp, #1052]
  str.w r8, [sp, #1180]
  //-- 9

  ldr r3, [r1, #32]
  ldr r4, [r1, #160]
  ldr r5, [r1, #288]
  ldr r6, [r1, #416]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1440]
  str.w r10, [sp, #1312]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #32]
  str.w r14, [sp, #1696]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1568]
  str.w r14, [sp, #160]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #288]
  str.w r8, [sp, #416]
  str.w r9, [sp, #544]
  str.w r11, [sp, #672]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #800]
  str.w r7, [sp, #928]
  str.w r12, [sp, #1056]
  str.w r8, [sp, #1184]
  //-- 10

  ldr r3, [r1, #36]
  ldr r4, [r1, #164]
  ldr r5, [r1, #292]
  ldr r6, [r1, #420]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1444]
  str.w r10, [sp, #1316]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #36]
  str.w r14, [sp, #1700]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1572]
  str.w r14, [sp, #164]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #292]
  str.w r8, [sp, #420]
  str.w r9, [sp, #548]
  str.w r11, [sp, #676]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #804]
  str.w r7, [sp, #932]
  str.w r12, [sp, #1060]
  str.w r8, [sp, #1188]
  //-- 11

  ldr r3, [r1, #40]
  ldr r4, [r1, #168]
  ldr r5, [r1, #296]
  ldr r6, [r1, #424]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1448]
  str.w r10, [sp, #1320]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #40]
  str.w r14, [sp, #1704]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1576]
  str.w r14, [sp, #168]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #296]
  str.w r8, [sp, #424]
  str.w r9, [sp, #552]
  str.w r11, [sp, #680]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #808]
  str.w r7, [sp, #936]
  str.w r12, [sp, #1064]
  str.w r8, [sp, #1192]
  //-- 12

  ldr r3, [r1, #44]
  ldr r4, [r1, #172]
  ldr r5, [r1, #300]
  ldr r6, [r1, #428]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1452]
  str.w r10, [sp, #1324]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #44]
  str.w r14, [sp, #1708]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1580]
  str.w r14, [sp, #172]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #300]
  str.w r8, [sp, #428]
  str.w r9, [sp, #556]
  str.w r11, [sp, #684]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #812]
  str.w r7, [sp, #940]
  str.w r12, [sp, #1068]
  str.w r8, [sp, #1196]
  //-- 13

  ldr r3, [r1, #48]
  ldr r4, [r1, #176]
  ldr r5, [r1, #304]
  ldr r6, [r1, #432]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1456]
  str.w r10, [sp, #1328]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #48]
  str.w r14, [sp, #1712]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1584]
  str.w r14, [sp, #176]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #304]
  str.w r8, [sp, #432]
  str.w r9, [sp, #560]
  str.w r11, [sp, #688]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #816]
  str.w r7, [sp, #944]
  str.w r12, [sp, #1072]
  str.w r8, [sp, #1200]
  //-- 14

  ldr r3, [r1, #52]
  ldr r4, [r1, #180]
  ldr r5, [r1, #308]
  ldr r6, [r1, #436]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1460]
  str.w r10, [sp, #1332]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #52]
  str.w r14, [sp, #1716]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1588]
  str.w r14, [sp, #180]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #308]
  str.w r8, [sp, #436]
  str.w r9, [sp, #564]
  str.w r11, [sp, #692]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #820]
  str.w r7, [sp, #948]
  str.w r12, [sp, #1076]
  str.w r8, [sp, #1204]
  //-- 15

  ldr r3, [r1, #56]
  ldr r4, [r1, #184]
  ldr r5, [r1, #312]
  ldr r6, [r1, #440]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1464]
  str.w r10, [sp, #1336]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #56]
  str.w r14, [sp, #1720]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1592]
  str.w r14, [sp, #184]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #312]
  str.w r8, [sp, #440]
  str.w r9, [sp, #568]
  str.w r11, [sp, #696]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #824]
  str.w r7, [sp, #952]
  str.w r12, [sp, #1080]
  str.w r8, [sp, #1208]
  //-- 16

  ldr r3, [r1, #60]
  ldr r4, [r1, #188]
  ldr r5, [r1, #316]
  ldr r6, [r1, #444]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1468]
  str.w r10, [sp, #1340]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #60]
  str.w r14, [sp, #1724]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1596]
  str.w r14, [sp, #188]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #316]
  str.w r8, [sp, #444]
  str.w r9, [sp, #572]
  str.w r11, [sp, #700]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #828]
  str.w r7, [sp, #956]
  str.w r12, [sp, #1084]
  str.w r8, [sp, #1212]
  //-- 17

  ldr r3, [r1, #64]
  ldr r4, [r1, #192]
  ldr r5, [r1, #320]
  ldr r6, [r1, #448]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1472]
  str.w r10, [sp, #1344]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #64]
  str.w r14, [sp, #1728]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1600]
  str.w r14, [sp, #192]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #320]
  str.w r8, [sp, #448]
  str.w r9, [sp, #576]
  str.w r11, [sp, #704]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #832]
  str.w r7, [sp, #960]
  str.w r12, [sp, #1088]
  str.w r8, [sp, #1216]
  //-- 18

  ldr r3, [r1, #68]
  ldr r4, [r1, #196]
  ldr r5, [r1, #324]
  ldr r6, [r1, #452]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1476]
  str.w r10, [sp, #1348]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #68]
  str.w r14, [sp, #1732]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1604]
  str.w r14, [sp, #196]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #324]
  str.w r8, [sp, #452]
  str.w r9, [sp, #580]
  str.w r11, [sp, #708]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #836]
  str.w r7, [sp, #964]
  str.w r12, [sp, #1092]
  str.w r8, [sp, #1220]
  //-- 19

  ldr r3, [r1, #72]
  ldr r4, [r1, #200]
  ldr r5, [r1, #328]
  ldr r6, [r1, #456]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1480]
  str.w r10, [sp, #1352]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #72]
  str.w r14, [sp, #1736]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1608]
  str.w r14, [sp, #200]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #328]
  str.w r8, [sp, #456]
  str.w r9, [sp, #584]
  str.w r11, [sp, #712]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #840]
  str.w r7, [sp, #968]
  str.w r12, [sp, #1096]
  str.w r8, [sp, #1224]
  //-- 20

  ldr r3, [r1, #76]
  ldr r4, [r1, #204]
  ldr r5, [r1, #332]
  ldr r6, [r1, #460]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1484]
  str.w r10, [sp, #1356]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #76]
  str.w r14, [sp, #1740]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1612]
  str.w r14, [sp, #204]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #332]
  str.w r8, [sp, #460]
  str.w r9, [sp, #588]
  str.w r11, [sp, #716]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #844]
  str.w r7, [sp, #972]
  str.w r12, [sp, #1100]
  str.w r8, [sp, #1228]
  //-- 21

  ldr r3, [r1, #80]
  ldr r4, [r1, #208]
  ldr r5, [r1, #336]
  ldr r6, [r1, #464]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1488]
  str.w r10, [sp, #1360]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #80]
  str.w r14, [sp, #1744]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1616]
  str.w r14, [sp, #208]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #336]
  str.w r8, [sp, #464]
  str.w r9, [sp, #592]
  str.w r11, [sp, #720]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #848]
  str.w r7, [sp, #976]
  str.w r12, [sp, #1104]
  str.w r8, [sp, #1232]
  //-- 22

  ldr r3, [r1, #84]
  ldr r4, [r1, #212]
  ldr r5, [r1, #340]
  ldr r6, [r1, #468]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1492]
  str.w r10, [sp, #1364]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #84]
  str.w r14, [sp, #1748]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1620]
  str.w r14, [sp, #212]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #340]
  str.w r8, [sp, #468]
  str.w r9, [sp, #596]
  str.w r11, [sp, #724]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #852]
  str.w r7, [sp, #980]
  str.w r12, [sp, #1108]
  str.w r8, [sp, #1236]
  //-- 23

  ldr r3, [r1, #88]
  ldr r4, [r1, #216]
  ldr r5, [r1, #344]
  ldr r6, [r1, #472]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1496]
  str.w r10, [sp, #1368]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #88]
  str.w r14, [sp, #1752]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1624]
  str.w r14, [sp, #216]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #344]
  str.w r8, [sp, #472]
  str.w r9, [sp, #600]
  str.w r11, [sp, #728]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #856]
  str.w r7, [sp, #984]
  str.w r12, [sp, #1112]
  str.w r8, [sp, #1240]
  //-- 24

  ldr r3, [r1, #92]
  ldr r4, [r1, #220]
  ldr r5, [r1, #348]
  ldr r6, [r1, #476]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1500]
  str.w r10, [sp, #1372]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #92]
  str.w r14, [sp, #1756]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1628]
  str.w r14, [sp, #220]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #348]
  str.w r8, [sp, #476]
  str.w r9, [sp, #604]
  str.w r11, [sp, #732]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #860]
  str.w r7, [sp, #988]
  str.w r12, [sp, #1116]
  str.w r8, [sp, #1244]
  //-- 25

  ldr r3, [r1, #96]
  ldr r4, [r1, #224]
  ldr r5, [r1, #352]
  ldr r6, [r1, #480]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1504]
  str.w r10, [sp, #1376]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #96]
  str.w r14, [sp, #1760]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1632]
  str.w r14, [sp, #224]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #352]
  str.w r8, [sp, #480]
  str.w r9, [sp, #608]
  str.w r11, [sp, #736]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #864]
  str.w r7, [sp, #992]
  str.w r12, [sp, #1120]
  str.w r8, [sp, #1248]
  //-- 26

  ldr r3, [r1, #100]
  ldr r4, [r1, #228]
  ldr r5, [r1, #356]
  ldr r6, [r1, #484]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1508]
  str.w r10, [sp, #1380]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #100]
  str.w r14, [sp, #1764]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1636]
  str.w r14, [sp, #228]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #356]
  str.w r8, [sp, #484]
  str.w r9, [sp, #612]
  str.w r11, [sp, #740]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #868]
  str.w r7, [sp, #996]
  str.w r12, [sp, #1124]
  str.w r8, [sp, #1252]
  //-- 27

  ldr r3, [r1, #104]
  ldr r4, [r1, #232]
  ldr r5, [r1, #360]
  ldr r6, [r1, #488]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1512]
  str.w r10, [sp, #1384]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #104]
  str.w r14, [sp, #1768]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1640]
  str.w r14, [sp, #232]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #360]
  str.w r8, [sp, #488]
  str.w r9, [sp, #616]
  str.w r11, [sp, #744]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #872]
  str.w r7, [sp, #1000]
  str.w r12, [sp, #1128]
  str.w r8, [sp, #1256]
  //-- 28

  ldr r3, [r1, #108]
  ldr r4, [r1, #236]
  ldr r5, [r1, #364]
  ldr r6, [r1, #492]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1516]
  str.w r10, [sp, #1388]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #108]
  str.w r14, [sp, #1772]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1644]
  str.w r14, [sp, #236]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #364]
  str.w r8, [sp, #492]
  str.w r9, [sp, #620]
  str.w r11, [sp, #748]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #876]
  str.w r7, [sp, #1004]
  str.w r12, [sp, #1132]
  str.w r8, [sp, #1260]
  //-- 29

  ldr r3, [r1, #112]
  ldr r4, [r1, #240]
  ldr r5, [r1, #368]
  ldr r6, [r1, #496]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1520]
  str.w r10, [sp, #1392]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #112]
  str.w r14, [sp, #1776]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1648]
  str.w r14, [sp, #240]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #368]
  str.w r8, [sp, #496]
  str.w r9, [sp, #624]
  str.w r11, [sp, #752]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #880]
  str.w r7, [sp, #1008]
  str.w r12, [sp, #1136]
  str.w r8, [sp, #1264]
  //-- 30

  ldr r3, [r1, #116]
  ldr r4, [r1, #244]
  ldr r5, [r1, #372]
  ldr r6, [r1, #500]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1524]
  str.w r10, [sp, #1396]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #116]
  str.w r14, [sp, #1780]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1652]
  str.w r14, [sp, #244]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #372]
  str.w r8, [sp, #500]
  str.w r9, [sp, #628]
  str.w r11, [sp, #756]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #884]
  str.w r7, [sp, #1012]
  str.w r12, [sp, #1140]
  str.w r8, [sp, #1268]
  //-- 31

  ldr r3, [r1, #120]
  ldr r4, [r1, #248]
  ldr r5, [r1, #376]
  ldr r6, [r1, #504]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1528]
  str.w r10, [sp, #1400]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #120]
  str.w r14, [sp, #1784]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1656]
  str.w r14, [sp, #248]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #376]
  str.w r8, [sp, #504]
  str.w r9, [sp, #632]
  str.w r11, [sp, #760]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #888]
  str.w r7, [sp, #1016]
  str.w r12, [sp, #1144]
  str.w r8, [sp, #1272]
  //-- 32

  ldr r3, [r1, #124]
  ldr r4, [r1, #252]
  ldr r5, [r1, #380]
  ldr r6, [r1, #508]
  uadd16 r7, r3, r5
  usub16 r8, r5, r3
  uadd16 r9, r7, r7
  uadd16 r10, r8, r8
  uadd16 r9, r9, r9
  uadd16 r10, r10, r10
  usub16 r7, r10, r7
  uadd16 r8, r8, r9
  uadd16 r9, r4, r6
  usub16 r10, r6, r4
  uadd16 r11, r9, r9
  uadd16 r12, r10, r10
  uadd16 r11, r11, r11
  uadd16 r12, r12, r12
  uadd16 r10, r10, r11
  usub16 r9, r12, r9
  str.w r7, [sp, #1532]
  str.w r10, [sp, #1404]
  uadd16 r11, r7, r7
  uadd16 r11, r11, r7
  usub16 r12, r11, r10
  usub16 r14, r10, r11
  str.w r12, [sp, #124]
  str.w r14, [sp, #1788]
  uadd16 r12, r10, r10
  uadd16 r12, r12, r10
  usub16 r12, r8, r12
  uadd16 r14, r9, r9
  uadd16 r14, r14, r9
  usub16 r14, r14, r7
  str.w r12, [sp, #1660]
  str.w r14, [sp, #252]
  usub16 r12, r10, r9
  uadd16 r10, r10, r12
  usub16 r9, r12, r9
  usub16 r8, r8, r7
  uadd16 r10, r10, r8
  uadd16 r14, r8, r8
  uadd16 r8, r8, r11
  uadd16 r8, r8, r12
  uadd16 r11, r11, r14
  uadd16 r12, r12, r12
  usub16 r11, r12, r11
  usub16 r9, r14, r9
  str.w r10, [sp, #380]
  str.w r8, [sp, #508]
  str.w r9, [sp, #636]
  str.w r11, [sp, #764]
  uadd16 r8, r5, r5
  uadd16 r7, r7, r8
  uadd16 r8, r8, r7
  uadd16 r9, r3, r3
  usub16 r7, r9, r7
  uadd16 r10, r4, r6
  usub16 r7, r7, r10
  uadd16 r11, r10, r10
  uadd16 r11, r11, r11
  uadd16 r11, r11, r10
  usub16 r8, r8, r11
  uadd16 r12, r4, r4
  uadd16 r12, r12, r11
  usub16 r3, r3, r5
  usub16 r3, r3, r9
  uadd16 r5, r3, r3
  uadd16 r5, r5, r5
  uadd16 r5, r5, r3
  uadd16 r12, r12, r5
  uadd16 r6, r6, r6
  uadd16 r6, r11, r6
  usub16 r3, r3, r6
  str.w r3, [sp, #892]
  str.w r7, [sp, #1020]
  str.w r12, [sp, #1148]
  str.w r8, [sp, #1276]
  
  //sub sp, #128
  add.w r1, sp, #2
  
  bl CMF_64_22
  add.w r0, r0, #32
  add.w r1, r1, #256
  add.w r2, r2, #32
  bl CMF_64_22
  add.w r0, r0, #32
  add.w r1, r1, #256
  add.w r2, r2, #32
  bl CMF_64_22
  add.w r0, r0, #32
  add.w r1, r1, #256
  add.w r2, r2, #32
  bl CMF_64_22
  add.w r0, r0, #32
  add.w r1, r1, #256
  add.w r2, r2, #32
  bl CMF_64_22
  add.w r0, r0, #32
  add.w r1, r1, #256
  add.w r2, r2, #32
  bl CMF_64_22
  add.w r0, r0, #32
  add.w r1, r1, #256
  add.w r2, r2, #32
  bl CMF_64_22
  add.w sp, #1792
  pop {r4-r11, pc}
  
  .global CVF_256_422
  .type CVF_256_422, %function
  .align 2
  CVF_256_422:
  push {r4-r11, lr}
  sub.w sp, #640
  add.w r12, r1, #128
  tmvp4_eval_B_loop:
  ldr.w 	r6, [r1, #384]
  ldr.w 	r4, [r1, #128]
  ldr.w 	r5, [r1, #256]
  ldr.w 	r3, [r1], #4
  cmp 	r1, r12
  uadd16 	r8, r4, r6
  uadd16 	r7, r3, r5
  uadd16 	r9, r7, r8
  usub16 	r10, r7, r8
  str.w r9, [sp, #128]
  str.w r10, [sp, #256]
  uadd16 	r7, r6, r6
  uadd16	r7, r7, r7
  uadd16	r7, r7, r4
  uadd16 	r7, r7, r7
  uadd16 	r8, r5, r5
  uadd16 	r8, r8, r8
  uadd16 	r8, r8, r3
  uadd16 	r9, r7, r8
  usub16 	r10, r8, r7
  str.w r9, [sp, #384]
  str.w r10, [sp, #512]
  uadd16 	r7, r7, r6
  usub16 	r7, r7, r4
  uadd16 	r10, r7, r7  
  uadd16 	r7, r7, r10
  uadd16 	r8, r8, r8
  uadd16 	r8, r8, r5
  usub16	r8, r8, r3
  uadd16	r7, r8, r7
  str.w r7, [sp], #4
  bne tmvp4_eval_B_loop
  sub sp, #128
  sub.w r1, #128			//B0
  
  bl CVF_64_22		//B0-->r0
  add.w r0, #1728
  add.w r1, #384			//B3
  bl CVF_64_22		//B3-->r0 1728
  sub.w r0, #288 
  mov r1, sp	
  bl CVF_64_22		// B0+3B1+9B2+27B3-->r0 1440
  sub.w r0, #288
  add.w r1, #512
  bl CVF_64_22		// B0-2B1+4B2-8B3->r0 1152
  sub.w r0, #288
  sub.w r1, #128
  bl CVF_64_22		// B0+2B1+4B2+8B3-->r0 864
  sub.w r0, #288
  sub.w r1, #128
  bl CVF_64_22		// B0-B1+B2-B3-->r0 576
  sub.w r0, #288
  sub.w r1, #128
  bl CVF_64_22		// B0+B1+B2+B3->r0 288
  add.w sp, #640
  pop {r4-r11, pc}
  
  
  //---------------------------------------------------------------
   
  .global CVF_64_22
  .func CVF_64_22, CVF_64_22
  .type CVF_64_22, %function
  .align 2
  CVF_64_22:
  push {lr}
  //iter 1/4
  ldr r4, [r1]
  ldr.w r5, [r1, #32]
  ldr.w r6, [r1, #64]
  ldr.w r7, [r1, #96]
  ldr.w r8, [r1, #4]
  ldr.w r9, [r1, #36]
  ldr.w r10, [r1, #68]
  ldr.w r11, [r1, #100]
  uadd16 r2, r4, r5
  uadd16 r3, r8, r9
  uadd16 r12, r6, r7
  uadd16 r14, r10, r11
  str.w r2, [r0, #128]
  str.w r3, [r0, #132]
  str.w r12, [r0, #96]
  str.w r14, [r0, #100]
  str.w r4, [r0, #256]
  str.w r5, [r0, #224]
  str.w r6, [r0, #192]
  str.w r7, [r0, #160]
  str.w r8, [r0, #260]
  str.w r9, [r0, #228]
  str.w r10, [r0, #196]
  str.w r11, [r0, #164]
  uadd16 r4, r4, r6
  uadd16 r8, r8, r10
  uadd16 r5, r5, r7
  uadd16 r9, r9, r11
  uadd16 r6, r2, r12
  uadd16 r7, r3, r14	
  str.w r4, [r0, #64]
  str.w r5, [r0, #32]
  str.w r8, [r0, #68]
  str.w r9, [r0, #36]
  str.w r6, [r0, #0]
  str.w r7, [r0, #4]
  //iter 2/4
  ldr.w r4, [r1, #8]
  ldr.w r5, [r1, #40]
  ldr.w r6, [r1, #72]
  ldr.w r7, [r1, #104]
  ldr.w r8, [r1, #12]
  ldr.w r9, [r1, #44]
  ldr.w r10, [r1, #76]
  ldr.w r11, [r1, #108]
  uadd16 r2, r4, r5
  uadd16 r3, r8, r9
  uadd16 r12, r6, r7
  uadd16 r14, r10, r11
  str.w r2, [r0, #136]
  str.w r3, [r0, #140]
  str.w r12, [r0, #104]
  str.w r14, [r0, #108]
  str.w r4, [r0, #264]
  str.w r5, [r0, #232]
  str.w r6, [r0, #200]
  str.w r7, [r0, #168]
  str.w r8, [r0, #268]
  str.w r9, [r0, #236]
  str.w r10, [r0, #204]
  str.w r11, [r0, #172]
  uadd16 r4, r4, r6
  uadd16 r8, r8, r10
  uadd16 r5, r5, r7
  uadd16 r9, r9, r11
  uadd16 r6, r2, r12
  uadd16 r7, r3, r14	
  str.w r4, [r0, #72]
  str.w r5, [r0, #40]
  str.w r8, [r0, #76]
  str.w r9, [r0, #44]
  str.w r6, [r0, #8]
  str.w r7, [r0, #12]
  //iter 3/4
  ldr.w r4, [r1, #16]
  ldr.w r5, [r1, #48]
  ldr.w r6, [r1, #80]
  ldr.w r7, [r1, #112]
  ldr.w r8, [r1, #20]
  ldr.w r9, [r1, #52]
  ldr.w r10, [r1, #84]
  ldr.w r11, [r1, #116]
  uadd16 r2, r4, r5
  uadd16 r3, r8, r9
  uadd16 r12, r6, r7
  uadd16 r14, r10, r11
  str.w r2, [r0, #144]
  str.w r3, [r0, #148]
  str.w r12, [r0, #112]
  str.w r14, [r0, #116]
  str.w r4, [r0, #272]
  str.w r5, [r0, #240]
  str.w r6, [r0, #208]
  str.w r7, [r0, #176]
  str.w r8, [r0, #276]
  str.w r9, [r0, #244]
  str.w r10, [r0, #212]
  str.w r11, [r0, #180]
  uadd16 r4, r4, r6
  uadd16 r8, r8, r10
  uadd16 r5, r5, r7
  uadd16 r9, r9, r11
  uadd16 r6, r2, r12
  uadd16 r7, r3, r14	
  str.w r4, [r0, #80]
  str.w r5, [r0, #48]
  str.w r8, [r0, #84]
  str.w r9, [r0, #52]
  str.w r6, [r0, #16]
  str.w r7, [r0, #20]
  //iter 4/4
  ldr.w r4, [r1, #24]
  ldr.w r5, [r1, #56]
  ldr.w r6, [r1, #88]
  ldr.w r7, [r1, #120]
  ldr.w r8, [r1, #28]
  ldr.w r9, [r1, #60]
  ldr.w r10, [r1, #92]
  ldr.w r11, [r1, #124]
  uadd16 r2, r4, r5
  uadd16 r3, r8, r9
  uadd16 r12, r6, r7
  uadd16 r14, r10, r11
  str.w r2, [r0, #152]
  str.w r3, [r0, #156]
  str.w r12, [r0, #120]
  str.w r14, [r0, #124]
  str.w r4, [r0, #280]
  str.w r5, [r0, #248]
  str.w r6, [r0, #216]
  str.w r7, [r0, #184]
  str.w r8, [r0, #284]
  str.w r9, [r0, #252]
  str.w r10, [r0, #220]
  str.w r11, [r0, #188]
  uadd16 r4, r4, r6
  uadd16 r8, r8, r10
  uadd16 r5, r5, r7
  uadd16 r9, r9, r11
  uadd16 r6, r2, r12
  uadd16 r7, r3, r14	
  str.w r4, [r0, #88]
  str.w r5, [r0, #56]
  str.w r8, [r0, #92]
  str.w r9, [r0, #60]
  str.w r6, [r0, #24]
  str.w r7, [r0, #28]
  pop {pc}

  .global interpol_22
  .type interpol_22,%function
  .align 2
  interpol_22:  
  push {r4-r5, lr}
  add.w r14, r0, #32
  interpol_22_loop:
  ldr r5, [r1, #32]				//S2
  ldr.w r6, [r1, #64]				//S3
  ldr.w r7, [r1, #96]				//S4
  ldr.w r8, [r1, #128]			//S5
  ldr.w r9, [r1, #160]			//S6
  ldr.w r10, [r1, #192]			//S7  
  ldr.w r11, [r1, #224]			//S8
  ldr.w r12, [r1, #256]			//S9  
  ldr r4, [r1], #4				//S1
  uadd16 r9, r7, r9			//S4+S6
  usub16 r7, r7, r10			//S4-S7
  usub16 r6, r4, r6			//S1-S3
  uadd16 r5, r4, r5			//S1+S2
  uadd16 r11, r8, r11		//S5+S8
  usub16 r12, r8, r12		//S5-S9
  uadd16 r9, r5, r9			//S1+S2+S4+S6
  uadd16 r7, r7, r6			//S1-S3+S4-S7	
  usub16 r5, r5, r11			//S1+S2-S5-S8
  usub16 r6, r6, r12  		//S1-S3-S5+S9
  str.w r7, [r0, #32]
  str.w r5, [r0, #64]
  str.w r6, [r0, #96]
  str.w r9, [r0], #4
  cmp r0, r14
  bne interpol_22_loop
  pop {r4-r5, pc}
  
  .global interpol_224
  .type interpol_224,%function
  .align 2
  interpol_224:
  push {r4-r11, lr}
  sub sp, #896
  mov r4, r0
  mov r0, sp
  bl interpol_22				//M0
  add.w r1, #256			//288-32
  add.w r0, #96				//128-32
  bl interpol_22				//M1
  add.w r1, #256
  add.w r0, #96
  bl interpol_22				//M2
  add.w r1, #256
  add.w r0, #96
  bl interpol_22				//M3
  add.w r1, #256
  add.w r0, #96
  bl interpol_22				//M4
  add.w r1, #256
  add.w r0, #96
  bl interpol_22				//M5
  add.w r1,  #256
  add.w r0, #96
  bl interpol_22				//M6
  movw r12, #43691		//3inv
  movw r14, #52429		//5inv
  pkhbt r12, r12, r14, lsl #16
  
  mov r0, r4
  add.w r14, r0, #128
  interpol_tmvp4:
  ldr r4, [sp, #128]			//M1
  ldr.w r5, [sp, #256]			//M2
  ldr.w r6, [sp, #384]			//M3
  ldr.w r7, [sp, #512]			//M4
  ldr.w r8, [sp, #640]			//M5
  ldr.w r9, [sp, #768]			//M6
  ldr.w r3, [sp], #4				//M0
 
  lsl r3, r3, #1
  and r3, r3, #0xfffefffe					// r3 =2M0  
  lsl r10, r4, #1
  and r10, r10, #0xfffefffe				// r10=2M1  
  usub16 r4, r10, r5							// r4=2M1-M2
  uadd16 r5, r10, r5							// r5=2M1+M2  
  smulbt r11, r7, r12
  smultt r10, r7, r12
  pkhbt r10, r11, r10, lsl #16			// r10= M4/5  
  
  uadd16 r7, r10, r6							// r7=M3+M4/5
  
  usub16 r6, r6, r10							// r6=M3-M4/5  
  smulbt r11, r8, r12
  smultt r8, r8, r12
  pkhbt r8, r11, r8, lsl #16				// r8=M5/5  
  
  uadd16 r3, r3, r7							// r3=2M0+M3+M4/5
  
  uadd16 r10, r8, r5							// r10=2M1+M2+M5/5
  uadd16 r3, r10, r3							// r3=2M0+2M1+M2+M3+M4/5+M5/5  
    
  smulbb r11, r3, r12
  smultb r3, r3, r12
  pkhbt r3, r11, r3, lsl #16				// r3=(2M0+2M1-M2+M3+M4/5+M5/5)/3  
  lsr r3, r3, #3
  and r3, r3, #0x1fff1fff					// r3=((2M0+2M1-M2+M3+M4/5+M5/5)/3)/8  
  str.w r3, [r0, #384]  

  lsl r3, r8, #1
  and r3, #0xfffefffe							// r3=2M5/5  
  uadd16 r8, r8, r3							// r8=3M5/5
  uadd16 r10, r4, r8							// r10=2M1-M2+3M5/5  
  lsr r3, r10, #1
  and r3, #0x7fff7fff							// r3=(2M1-M2+3M5/5)/2  
  uadd16 r11, r6, r3							// r11=(2M1-M2+3M5/5)/2+M3-M4/5  
  smulbb r3, r11, r12
  smultb r11, r11, r12
  pkhbt r11, r3, r11, lsl #16				// r11=((2M1-M2+3M5/5)/2+M3-M4/5)/3  
  lsr r11, r11, #2
  and r11, #0x1fff1fff						// r11=(((2M1-M2+3M5/5)/2+M3-M4/5)/3)/4  
  str.w r11, [r0, #256]  
  lsl r11, r8, #1
  and r11, #0xfffefffe							// r11= 6M5/5  
  uadd16 r8, r8, r11							// r8=9M5/5
  uadd16 r10, r8, r5								// r10=2M1+M2+9M5/5  
  lsr r3, r10, #2
  and r3, #0x3fff3fff								// r3=(2M1+M2+9M5/5)/4  
  uadd16 r10, r7, r3								// r10=((2M1+M2+9M5/5)/4)+M3+M4/5  
  smulbb r3, r10, r12
  smultb r10, r10, r12
  pkhbt r10, r3, r10, lsl #16					// r10= (((2M1+M2+9M5/5)/4)+M3+M4/5)/3  
  lsr r10, r10, #1
  and r10, #0x1fff1fff							// r10= ((((2M1+M2+9M5/5)/4)+M3+M4/5)/3)/2  
  str.w r10, [r0, #128]  
  lsl r3, r8, #1
  and r3, #0xfffefffe								// r3=18M5/5  
  uadd16 r8, r8, r3								// r8=27M5/5
  uadd16 r10, r8, r4								// r10=2M1-M2+27M5/5  
  lsr r3, r10, #3
  and r3, #0x1fff1fff								// r3= (2M1-M2+27M5/5)/8  
  uadd16 r10, r3, r6								// r10=(2M1-M2+27M5/5)/8+M3-M4/5  
  smulbb r3, r10, r12
  smultb r10, r10, r12
  pkhbt r10, r3, r10, lsl #16					// r10=((2M1-M2+27M5/5)/8+M3-M4/5)/3  
  uadd16 r10, r10, r9							// r10=(((2M1-M2+27M5/5)/8+M3-M4/5)/3)+M6
  and r10, #0x1fff1fff
  str.w r10, [r0], #4
  cmp r0, r14
  bne interpol_tmvp4
  
  add.w sp, #768
  pop {r4-r11, pc}