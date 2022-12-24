public class C3x5_RLMRL_UDU {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 5
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
            }

            for up1 in 0..<wordCount {

                if (W.Len[up1] >= interlockHeight) {
                    //print("up1:\(W.Start[up1])")

                    for right1 in 0..<wordCount {

                        if (W.Len[right1] >= interlockWidth &&
                            W.Start[right1][0] == W.End[up1][4] &&
                            W.Id[right1] != W.Id[up1]) {
                            //print("right1:\(W.Start[right1])")

                            for down2 in 0..<wordCount {

                                if (W.Len[down2] >= interlockHeight &&
                                    W.Start[down2][0] == W.Start[right1][1] &&
                                    W.Id[down2] != W.Id[right1] &&
                                    W.Id[down2] != W.Id[up1]) {
                                    //print("down2:\(W.Start[down2])")

                                    for left2 in 0..<wordCount {

                                        if (W.Len[left2] >= interlockWidth &&
                                            W.End[left2][2] == W.End[up1][3] &&
                                            W.End[left2][1] == W.Start[down2][1] &&
                                            W.Id[left2] != W.Id[down2] &&
                                            W.Id[left2] != W.Id[right1] &&
                                            W.Id[left2] != W.Id[up1]) {
                                            //print("left2:\(W.Start[left2])")

                                            for up3 in 0..<wordCount {

                                                if (W.Len[up3] >= interlockHeight &&
                                                    W.End[up3][4] == W.Start[right1][2] &&
                                                    W.End[up3][3] == W.End[left2][0] &&
                                                    W.Id[up3] != W.Id[left2] &&
                                                    W.Id[up3] != W.Id[down2] &&
                                                    W.Id[up3] != W.Id[right1] &&
                                                    W.Id[up3] != W.Id[up1]) {
                                                    //print("up3:\(W.Start[up3])")

                                                    for middlex3 in 0..<wordCount {

                                                        if (W.Len[middlex3] == interlockWidth &&
                                                            W.Start[middlex3][0] == W.End[up1][2] &&
                                                            W.Start[middlex3][1] == W.Start[down2][2] &&
                                                            W.Start[middlex3][2] == W.End[up3][2] &&
                                                            W.Id[middlex3] != W.Id[up3] &&
                                                            W.Id[middlex3] != W.Id[left2] &&
                                                            W.Id[middlex3] != W.Id[down2] &&
                                                            W.Id[middlex3] != W.Id[right1] &&
                                                            W.Id[middlex3] != W.Id[up1]) {
                                                            //print("middlex3:\(W.Start[middlex3])")

                                                            for right4 in 0..<wordCount {

                                                                if (W.Len[right4] >= interlockWidth &&
                                                                    W.Start[right4][0] == W.End[up1][1] &&
                                                                    W.Start[right4][1] == W.Start[down2][3] &&
                                                                    W.Start[right4][2] == W.End[up3][1] &&
                                                                    W.Id[right4] != W.Id[middlex3] &&
                                                                    W.Id[right4] != W.Id[up3] &&
                                                                    W.Id[right4] != W.Id[left2] &&
                                                                    W.Id[right4] != W.Id[down2] &&
                                                                    W.Id[right4] != W.Id[right1] &&
                                                                    W.Id[right4] != W.Id[up1]) {
                                                                    //print("right4:\(W.Start[right4])")

                                                                    for left5 in 0..<wordCount {

                                                                        if (W.Len[left5] >= interlockWidth &&
                                                                            W.End[left5][2] == W.End[up1][0] &&
                                                                            W.End[left5][1] == W.Start[down2][4] &&
                                                                            W.End[left5][0] == W.End[up3][0] &&
                                                                            W.Id[left5] != W.Id[right4] &&
                                                                            W.Id[left5] != W.Id[middlex3] &&
                                                                            W.Id[left5] != W.Id[up3] &&
                                                                            W.Id[left5] != W.Id[left2] &&
                                                                            W.Id[left5] != W.Id[down2] &&
                                                                            W.Id[left5] != W.Id[right1] &&
                                                                            W.Id[left5] != W.Id[up1]) {
                                                                            //print("left5:\(W.Start[left5])")

                                                                            if phase == 0 {
                                                                                shapeCount += 1
                                                                            }
                                                                            else {
                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [right1, left2, middlex3, right4, left5, up1, down2, up3])
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: [],
            patternHorizontal: [.trailing, .leading, .middle, .trailing, .leading],
            patternVertical: [.leading, .trailing, .leading],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}