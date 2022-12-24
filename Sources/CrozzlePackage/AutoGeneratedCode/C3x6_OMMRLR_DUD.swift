public class C3x6_OMMRLR_DUD {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 6
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var outerStart: [UInt8] = []
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
                outerStart = Array(repeating: 0, count: stride * shapeCount)
            }

            for down1 in 0..<wordCount {

                if (W.Len[down1] >= interlockHeight) {
                    //print("down1:\(W.Start[down1])")

                    for outerx1 in 0..<wordCount {

                        if W.Len[outerx1] >= interlockWidth + 2 {

                            let outerx1Limit = Int(W.Len[outerx1]) - Int(interlockWidth)
                            for outerx1Pos in 1..<outerx1Limit {

                                if (W.Start[outerx1][outerx1Pos + 0] == W.Start[down1][0] &&
                                W.Id[outerx1] != W.Id[down1]) {
                                    //print("outerx1:\(W.Start[outerx1])")

                                    for up2 in 0..<wordCount {

                                        if (W.Len[up2] >= interlockHeight &&
                                            W.End[up2][5] == W.Start[outerx1][outerx1Pos + 1] &&
                                            W.Id[up2] != W.Id[outerx1] &&
                                            W.Id[up2] != W.Id[down1]) {
                                            //print("up2:\(W.Start[up2])")

                                            for middlex2 in 0..<wordCount {

                                                if (W.Len[middlex2] == interlockWidth &&
                                                    W.Start[middlex2][0] == W.Start[down1][1] &&
                                                    W.Start[middlex2][1] == W.End[up2][4] &&
                                                    W.Id[middlex2] != W.Id[up2] &&
                                                    W.Id[middlex2] != W.Id[outerx1] &&
                                                    W.Id[middlex2] != W.Id[down1]) {
                                                    //print("middlex2:\(W.Start[middlex2])")

                                                    for down3 in 0..<wordCount {

                                                        if (W.Len[down3] >= interlockHeight &&
                                                            W.Start[down3][0] == W.Start[outerx1][outerx1Pos + 2] &&
                                                            W.Start[down3][1] == W.Start[middlex2][2] &&
                                                            W.Id[down3] != W.Id[middlex2] &&
                                                            W.Id[down3] != W.Id[up2] &&
                                                            W.Id[down3] != W.Id[outerx1] &&
                                                            W.Id[down3] != W.Id[down1]) {
                                                            //print("down3:\(W.Start[down3])")

                                                            for middlex3 in 0..<wordCount {

                                                                if (W.Len[middlex3] == interlockWidth &&
                                                                    W.Start[middlex3][0] == W.Start[down1][2] &&
                                                                    W.Start[middlex3][1] == W.End[up2][3] &&
                                                                    W.Start[middlex3][2] == W.Start[down3][2] &&
                                                                    W.Id[middlex3] != W.Id[down3] &&
                                                                    W.Id[middlex3] != W.Id[middlex2] &&
                                                                    W.Id[middlex3] != W.Id[up2] &&
                                                                    W.Id[middlex3] != W.Id[outerx1] &&
                                                                    W.Id[middlex3] != W.Id[down1]) {
                                                                    //print("middlex3:\(W.Start[middlex3])")

                                                                    for right4 in 0..<wordCount {

                                                                        if (W.Len[right4] >= interlockWidth &&
                                                                            W.Start[right4][0] == W.Start[down1][3] &&
                                                                            W.Start[right4][1] == W.End[up2][2] &&
                                                                            W.Start[right4][2] == W.Start[down3][3] &&
                                                                            W.Id[right4] != W.Id[middlex3] &&
                                                                            W.Id[right4] != W.Id[down3] &&
                                                                            W.Id[right4] != W.Id[middlex2] &&
                                                                            W.Id[right4] != W.Id[up2] &&
                                                                            W.Id[right4] != W.Id[outerx1] &&
                                                                            W.Id[right4] != W.Id[down1]) {
                                                                            //print("right4:\(W.Start[right4])")

                                                                            for left5 in 0..<wordCount {

                                                                                if (W.Len[left5] >= interlockWidth &&
                                                                                    W.End[left5][2] == W.Start[down1][4] &&
                                                                                    W.End[left5][1] == W.End[up2][1] &&
                                                                                    W.End[left5][0] == W.Start[down3][4] &&
                                                                                    W.Id[left5] != W.Id[right4] &&
                                                                                    W.Id[left5] != W.Id[middlex3] &&
                                                                                    W.Id[left5] != W.Id[down3] &&
                                                                                    W.Id[left5] != W.Id[middlex2] &&
                                                                                    W.Id[left5] != W.Id[up2] &&
                                                                                    W.Id[left5] != W.Id[outerx1] &&
                                                                                    W.Id[left5] != W.Id[down1]) {
                                                                                    //print("left5:\(W.Start[left5])")

                                                                                    for right6 in 0..<wordCount {

                                                                                        if (W.Len[right6] >= interlockWidth &&
                                                                                            W.Start[right6][0] == W.Start[down1][5] &&
                                                                                            W.Start[right6][1] == W.End[up2][0] &&
                                                                                            W.Start[right6][2] == W.Start[down3][5] &&
                                                                                            W.Id[right6] != W.Id[left5] &&
                                                                                            W.Id[right6] != W.Id[right4] &&
                                                                                            W.Id[right6] != W.Id[middlex3] &&
                                                                                            W.Id[right6] != W.Id[down3] &&
                                                                                            W.Id[right6] != W.Id[middlex2] &&
                                                                                            W.Id[right6] != W.Id[up2] &&
                                                                                            W.Id[right6] != W.Id[outerx1] &&
                                                                                            W.Id[right6] != W.Id[down1]) {
                                                                                            //print("right6:\(W.Start[right6])")

                                                                                            if phase == 0 {
                                                                                                shapeCount += 1
                                                                                            }
                                                                                            else {
                                                                                                outerStart[index + 0] = UInt8(outerx1Pos)

                                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [outerx1, middlex2, middlex3, right4, left5, right6, down1, up2, down3])
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
                    }
                }
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.outer, .middle, .middle, .trailing, .leading, .trailing],
            patternVertical: [.trailing, .leading, .trailing],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}